export const strLimit = (string, limit = 100) => string.length > limit ? string.slice(0, limit - 3) + '...' : string
export const strToMoney = value =>
  Intl.NumberFormat('pt-BR', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  }).format(value)