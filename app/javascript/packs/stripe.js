import '@stripe/stripe-js';

const button = document.getElementById("stripe")
const id = location.pathname.split("/")[2]
button.addEventListener("click", (e) => {
  fetch(`/payments?id=${id}`, {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then((res) => {
    return res.json()
  })
  .then((data) => {
    const stripe = Stripe("pk_test_51HmtRQCVj7ZbCxVkGsrJdyCKZQ2CtzpxTQfGRHYyudpzER6TlEzVUFzNxGjRGjlzugvhLRiDse0xHVWZ0IVWdPv900xB3Hu41c");
    stripe.redirectToCheckout({
      sessionId: data.id
    })
  })
  .catch((err) => {
    console.log(err.message)
  })
})