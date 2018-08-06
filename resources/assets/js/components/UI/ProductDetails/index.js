import React from 'react'
import Modal from 'react-responsive-modal'
import PropTypes from 'prop-types'
import FullProduct from "../FullProduct"

function ProductDetails(props) {
  return (
    <Modal
      open={!!props.product}
      onClose={props.close}
      classNames={{
        overlay: 'modal__overlay',
        modal: 'modal__body',
        closeButton: 'modal__close-button',
        closeIcon: 'modal__close-icon'
      }}>
      <div className="modal__title">Detalhes</div>
      <div className="modal__content">
        <FullProduct product={props.product} close={props.close}/>
      </div>
    </Modal>
  )
}

ProductDetails.propTypes = {
  product: PropTypes.object,
  close: PropTypes.func.isRequired,
}

export default ProductDetails