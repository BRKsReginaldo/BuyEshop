import React from 'react'
import {strLimit, strToMoney} from "../../../reuseable/text"

function Product(props) {
  return (
    <div className="product">
      <div className="product__image">
        <img src={props.product.logo} alt={props.product.title}/>
      </div>
      <div className="product__title">
        {props.product.title} - R$ {strToMoney(props.product.price)}
      </div>
      <div className="product__short-description">
        {strLimit(props.product.short_description, 80)}
      </div>
    </div>
  )
}

export default Product