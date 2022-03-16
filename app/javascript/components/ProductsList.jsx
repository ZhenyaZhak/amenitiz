import React from "react"
import styles from '../stylesheets/catalog.scss'

const ProductsList = (props) => {
  return (
    <div>
      <h2>Market</h2>
      {props.products.map((product) => {
        return(
          <div key={product.code} className="productContainer" data-id={`product_${product.code}`}>
            <div className="productDescription">
              <span>{product.name} </span>
              <span>{product.price_cents / 100}$</span>
            </div>
            <button onClick={() => props.addButtonHandler(product.code, product.name, )}> Add product</button>
            <div  data-id={`product_${product.id}_quantity`}></div>
          </div>
        )
      })}
    </div>
  )
}

export default ProductsList
