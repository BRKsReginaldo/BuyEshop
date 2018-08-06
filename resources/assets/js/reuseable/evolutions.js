export const toggleShowEvolution = (key = 'show', to = undefined) => state => {
  return {
    [key]: to === undefined ? !state[key] : to
  }
}