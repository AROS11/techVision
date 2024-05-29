import React from 'react'
import {Card} from 'react-bootstrap'
import Rating from './Rating'
import {Link} from 'react-router-dom'

function Product({ product }) {
  return (

    <Card id="ProdCard" className="my-3 p-3 rounded">
        <Link to={`/product/${product._id}`}>
            <Card.Img className='productImage' src={product.image}/>
        </Link>

        <Card.Body>
            <Link to={`/product/${product._id}`}>
                <Card.Title as="div">

                    <div className="rza">
                    <strong>{product.name}</strong>
                    </div>
                </Card.Title>
            </Link>

            <Card.Text as="div">
                <div className="my-3">
                    <Rating value={product.rating} text={`${product.numReviews} reviews`} color={'#f8e825'}/>
                </div>
            </Card.Text>

            <Card.Text as="h3">
                ${product.price}
            </Card.Text>
        </Card.Body>
    </Card>
  )
}

export default Product