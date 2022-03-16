import React,{ useState } from "react"
import Cart from "./Cart";
import OrdersList from "./OrdersList";
import ProductsList from "./ProductsList";

const Market = (props) => {
  const parsedProductsFromLocalStorage = JSON.parse(window.localStorage.getItem('products')) || []
  const [ loaclStorageProducts, setLoaclStorageProducts ] = useState(parsedProductsFromLocalStorage)
  const [ orders, setOrders ] = useState(props.orders)
  const [ addProductTrigger, setAddProductTrigger ] = useState(false)

  function orderParams() {
    const params = loaclStorageProducts.map((product) => {
      return { product_code: product.product_code, quantity: product.quantity }
    }).filter(obj => obj.quantity !== 0)

    return params
  }

  function updateLocalStorage(productCode, productName, newQuantity, productsPrice) {
    const productsFromStorage = loaclStorageProducts
    const productsInfo = productsFromStorage.find(product => product.product_code === productCode)
    const newValue = { product_code: productCode, product_name: productName, quantity: newQuantity, products_price: productsPrice }
    if (productsInfo) {
      productsFromStorage.find(product => product.product_code === productCode).quantity = newValue.quantity
      productsFromStorage.find(product => product.product_code === productCode).products_price = newValue.products_price
    } else {
      productsFromStorage.push( newValue )
    }

    window.localStorage.setItem('products', JSON.stringify(productsFromStorage))
    setLoaclStorageProducts(productsFromStorage)
    addProductTriggerCall()
  }

  function addButtonHandler(productCode, productName) {
    const quantityElement = document.querySelector(`[data-id="cartProduct_${productCode}_quantity"]`)
    let quantity = 0
    if(quantityElement){
      quantity = parseInt(quantityElement.innerHTML) + 1
    } else {
      quantity = 1
    }

    changeCartRequest(productCode, productName, quantity)
  }

  function deleteButtonHandler(productCode, productName) {
    let quantity = parseInt(document.querySelector(`[data-id="cartProduct_${productCode}_quantity"]`).innerHTML)
    if(quantity !== 0 ){
      changeCartRequest(productCode, productName, quantity - 1)
    }
  }

   function changeCartRequest(productCode, productName, quantity){
    const params = { product_code: productCode, quantity: quantity}
    $.ajax({
      url: "/carts/calculate_products_price",
      data: {cart_params: params},
      dataType: "json",
    }).done( function(data){
        updateLocalStorage(productCode, productName, quantity, data.total_price)
    })
  }

  function addProductTriggerCall() {
    setAddProductTrigger(!addProductTrigger)
  }

  function submitOrder() {
    const total_price = document.querySelector(`[class="totalPrice"`).innerHTML
    $.post({
      url: "/orders",
      data: { order_params: orderParams(), total_price: total_price},
      dataType: "json",
    }).done( function(data) {
      setOrders(data.orders)
      window.localStorage.clear()
      setLoaclStorageProducts([])
    })
  }

  return(
    <>
      <div className="container">
        <div className="productsContainer">
          <ProductsList products={props.products} addButtonHandler={addButtonHandler}/>
        </div>
        <div className="cartContainer">
          <Cart
            loaclStorageProducts={loaclStorageProducts}
            addProductTrigger={addProductTrigger}
            addButtonHandler={addButtonHandler}
            deleteButtonHandler={deleteButtonHandler}
            submitOrder={submitOrder}/>
        </div>
      </div>
      <OrdersList orders={orders} />
    </>
  )
}

export default Market
