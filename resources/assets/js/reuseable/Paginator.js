import {hasMorePages} from "./logics"

class Paginator {
  query = null
  dataKey = null
  context = null
  fetchingMore = false

  constructor(context, dataKey, query) {
    this.query = query
    this.dataKey = dataKey
    this.context = context

  }

  tryFetchMore = ev => {
    if (this.fetchingMore || !this.context['props']['data'][this.dataKey]['cursor']['hasPages']) return

    const key = this.dataKey

    if (this.context.props.data.hasOwnProperty(key)) {
      const data = this.context.props.data[key]['cursor']
      if (hasMorePages(data['currentPage'] || 1, data['perPage'] || 10, data['total'] || 0)) {
        this.fetchMore()
      }
    }
  }

  hasPages = () => {
    const data = this.context.props.data[this.dataKey]['cursor']
    return hasMorePages(data['currentPage'] || 1, data['perPage'] || 10, data['total'] || 0)
  }

  fetchMore = async () => {
    if (this.fetchingMore || !this.context['props']['data'][this.dataKey]['cursor']['hasPages']) return

    try {
      this.fetchingMore = true

      await this.context['props']['data']['fetchMore']({
        query: this.query,
        variables: {
          ...this.context['props']['data']['variables'],
          page: this.context['props']['data'][this.dataKey]['cursor']['currentPage'] + 1
        },
        updateQuery: (prev, {fetchMoreResult}) => {
          if (!fetchMoreResult) return

          let items = prev[this.dataKey]['items'].concat(fetchMoreResult[this.dataKey]['items'])
          let cursor = {...fetchMoreResult[this.dataKey]['cursor']}

          return {
            ...prev,
            [this.dataKey]: {
              items,
              cursor,
              __typename: prev[this.dataKey]['__typename']
            }
          }
        }
      })

    } catch (e) {
      alert('Ocorreu um erro inesperado! Tente novamente mais tarde')
    } finally {
      this.fetchingMore = false
    }
  }
}

export default Paginator