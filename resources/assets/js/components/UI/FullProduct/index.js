import React, {Fragment} from 'react'
import PropTypes from 'prop-types'
import {strToMoney} from "../../../reuseable/text"

function FullProduct(props) {
  if (!props.product) return null

  return (
    <div className="full-product">
      <div className="full-product__image">
        <img src={props.product.logo} alt={props.product.title}/>
      </div>
      <div className="full-product__details">
        <div className="full-product__name"><b>{props.product.title}</b> - R$ {strToMoney(props.product.price)}</div>
        <div className="full-product__description">{props.product.short_description}</div>
        <div className="full-product__actions">
          <button onClick={props.close} className="full-product__action full-product__action--error">Fechar</button>
          <a href={props.product.link} target="_blank" className="full-product__action full-product__action--success">Ver na loja</a>
        </div>
      </div>
    </div>
  )
}

FullProduct.propTypes = {
  product: PropTypes.object,
  close: PropTypes.func.isRequired
}

export default FullProduct