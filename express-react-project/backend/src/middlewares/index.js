import csurf from 'csurf'

export const protectCsrf = csurf({cookie: true})
