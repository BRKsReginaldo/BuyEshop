import React, {Component, Fragment} from 'react'
import {Query} from "react-apollo"
import {getHighlight} from '../../graphql/queries/productQueries.graphql'
import Showcase from "../../components/UI/Showcase"
import {hasMorePages} from "../../reuseable/logics"
import LoadingScreen from "../../components/UI/LoadingScreen"
import ErrorScreen from "../../components/UI/ErrorScreen"

class Home extends Component {
  render() {
    return (
      <div className="page">
        <h1 className="page__subtitle">Ofertas</h1>
        <Query
          query={getHighlight}
          variables={{
            limit: 25
          }}>
          {({loading, error, data}) => {
            if (error) return <ErrorScreen/>
            if (loading && !data.highlight) return <LoadingScreen/>
            if (!data.highlight.items.length) return <div>nenhuma oferta atualmente ativa!</div>

            return <Showcase products={data.highlight.items}/>

          }}
        </Query>
      </div>
    )
  }
}

export default Home