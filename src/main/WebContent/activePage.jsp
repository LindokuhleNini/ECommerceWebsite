<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<script type="text/javascript">
const activePage = window.location.pathname;
console.log(activePage);
const navLinks = document.querySelectorAll('li a').forEach(link => {
  if(link.href.includes(activePage)){
    link.classList.add('active');
  }
})


</script>

</body>
</html>