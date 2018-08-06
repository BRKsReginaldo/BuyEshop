export const breakpoints = {
  desktopLg: 1400,
  desktopMd: 1300,
  desktopSm: 1200,
  tabletLg: 1040,
  tabletMd: 991,
  tabletSm: 840,
  mobileLg: 767,
  mobileMd: 540,
  mobileSm: 400
};

export const matchQuery = (breakpoint) => (desktopFirst = false) =>  window.matchMedia(`(${desktopFirst ? 'max' : 'min'}-width: ${breakpoint}px)`).matches

export default {
  breakpoints,
  matchQuery
}