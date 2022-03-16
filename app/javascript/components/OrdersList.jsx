import React, { useEffect, useState } from "react"
import styles from '../stylesheets/catalog.scss'

const OrdersList = (props) => {

  function goToOrderPage(orderId){
    window.location.href = `/orders/${orderId}`
  }

  return (
    <div>
      <h2>Orders</h2>
      {props.orders.map((order) => {
        return(
          <div key={order.id} className="orderContainer">
            <div className="orderDescription">
              <span>{order.id}</span>
              <span>{order.amount_cents / 100}$</span>
              <span>{order.created_at}</span>
              <button onClick={() => goToOrderPage(order.id)}>Order info</button>
            </div>
          </div>

        )
      })}
    </div>
  )
}

export default OrdersList
