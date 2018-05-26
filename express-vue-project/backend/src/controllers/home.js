
export const home = (req, res) => {
  res.render('home.html', { title: 'Home', message: "Welcome to express ..." }) 
}

export const vue = (req, res) => {
  res.render('vue.html', {app_env: process.env.APP_ENV}) 
}

export const form = (req, res) => {
  let data = {
    title: 'Form',
    message: "Form in express ...",
    errors: req.flash('error'),
    csrfToken: req.csrfToken() }
  res.render('form.html', data )
} 

