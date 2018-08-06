import React from 'react'
import ReactDOM from 'react-dom'
import Root from './Root'
import {HttpLink} from "apollo-link-http"
import {ApolloClient} from "apollo-client"
import {InMemoryCache} from "apollo-cache-inmemory"
import {ApolloProvider} from "react-apollo"
import {BrowserRouter} from "react-router-dom"

const client = new ApolloClient({
  link: new HttpLink({
    uri: '/graphql'
  }),
  cache: new InMemoryCache()
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <BrowserRouter basename="/app">
      <Root/>
    </BrowserRouter>
  </ApolloProvider>,
  document.getElementById('root')
)