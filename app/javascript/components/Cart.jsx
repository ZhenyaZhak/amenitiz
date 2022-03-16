import React, { useState } from "react"
import styles from '../stylesheets/catalog.scss'

const Cart = (props) => {
  const [cartProducts, setCartProducts] = useState(props.loaclStorageProducts || [])

  function cartPrice(cartProducts){
    const pricesАrray = cartProducts.filter(cartProducts =>  cartProducts.quantity !== 0 )
                                     .map(product => product.products_price)
    if(pricesАrray.length !== 0) {
      return pricesАrray.reduce((accum,sum) => accum + sum ).toFixed(2)
    }
    return undefined
  }

  function submitCart() {
    props.submitOrder()
    setCartProducts([])
  }

  return(
    <div>
      <h2>Your Cart</h2>
      {cartProducts.filter(cartProducts =>  cartProducts.quantity !== 0 ).map((cartProduct) => {
        return(
          <div key={cartProduct.product_code} className="cartProductContainer">
            <div className="cartProductInfo">
              <div className="cartProductName"> {cartProduct.product_name}: </div>
              <div className="cartProductQuantity" data-id={`cartProduct_${cartProduct.product_code}_quantity`}> {cartProduct.quantity} </div>
              <div className="cartProductPrice" data-id={`cartProduct_${cartProduct.product_code}_price`}> {cartProduct.products_price}$ </div>
            </div>
            <div className="cartButtons">
              <button onClick={() => props.deleteButtonHandler(cartProduct.product_code)}> Delete product</button>
              <button onClick={() => props.addButtonHandler(cartProduct.product_code)}> Add product</button>
            </div>
          </div>
        )
      })}
      {
        cartPrice(cartProducts) &&
        <div className="cartTotalBlock">
          <span>Total Price:</span>
          <span className="totalPrice">{cartPrice(cartProducts)}$</span>
          <button className="submitOrder" onClick={() => submitCart()}>Submit order</button>
        </div>
      }
    </div>
  )
}

export default Cart
