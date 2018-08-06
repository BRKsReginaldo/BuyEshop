import React from 'react'

export default (callback = () => {}) => WrappedComponent => props => {
  return <WrappedComponent {...props} {...callback(props)}/>
}