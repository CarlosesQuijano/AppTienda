<?php
class Productos extends Validator
{
	//Declaración de propiedades
	private $id = null;
	private $nombre = null;
	private $descripcion = null;
	private $precio = null;
	private $imagen = null;
	private $categoria = null;
	private $estado = null;
	private $ruta = '../../resources/img/productos/';

	//Métodos para sobrecarga de propiedades
	public function setId($value)
	{
		if ($this->validateId($value)) {
			$this->id = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getId()
	{
		return $this->id;
	}

	public function setNombre($value)
	{
		if ($this->validateAlphanumeric($value, 1, 50)) {
			$this->nombre = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getNombre()
	{
		return $this->nombre;
	}

	public function setDescripcion($value)
	{
		if ($this->validateAlphanumeric($value, 1, 200)) {
			$this->descripcion = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getDescripcion()
	{
		return $this->descripcion;
	}

	public function setPrecio($value)
	{
		if ($this->validateMoney($value)) {
			$this->precio = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getPrecio()
	{
		return $this->precio;
	}

	public function setImagen($file, $name)
	{
		if ($this->validateImageFile($file, $this->ruta, $name, 500, 500)) {
			$this->imagen = $this->getImageName();
			return true;
		} else {
			return false;
		}
	}

	public function getImagen()
	{
		return $this->imagen;
	}

	public function setCategoria($value)
	{
		if ($this->validateId($value)) {
			$this->categoria = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getCategoria()
	{
		return $this->categoria;
	}

	public function setEstado($value)
	{
		if ($value == '1' || $value == '0') {
			$this->estado = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getEstado()
	{
		return $this->estado;
	}

	public function getRuta()
	{
		return $this->ruta;
	}

	public function setCantidad($value)
	{
		if ($this->validateId($value)) {
			$this->cantidad = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getCantidad($value)
	{
		return $this->cantidad;
	}

	public function setIdProducto($value)
	{
		if ($this->validateId($value)) {
			$this->cantidad = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getIdProducto($value)
	{
		return $this->cantidad;
	}

	public function setIdCliente($value)
	{
		if ($this->validateId($value)) {
			$this->cantidad = $value;
			return true;
		} else {
			return false;
		}
	}

	public function getIdCliente($value)
	{
		return $this->cantidad;
	}



	//Metodos para el manejo del CRUD
	public function readProductosCategoria()
	{
		$sql = 'SELECT nombre_categoria, id_producto, imagen_producto, nombre_producto, descripcion_producto, precio_producto FROM productos INNER JOIN categorias USING(id_categoria) WHERE id_categoria = ? AND estado_producto = 1 ORDER BY nombre_producto';
		$params = array($this->categoria);
		return Conexion::getRows($sql, $params);
	}

	public function readProductos()
	{
		$sql = 'SELECT id_producto, imagen_producto, nombre_producto, descripcion_producto, precio_producto, nombre_categoria, estado_producto FROM productos INNER JOIN categorias USING(id_categoria) ORDER BY nombre_producto';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}

	public function readProductos1()
	{
		$sql = 'SELECT Nombre_categoria, id_producto, Nombre_producto, precio_producto FROM productos INNER JOIN categorias USING(id_categoria) ORDER by id_categoria ';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}

	public function searchProductos($value)
	{
		$sql = 'SELECT id_producto, imagen_producto, nombre_producto, descripcion_producto, precio_producto, nombre_categoria, estado_producto FROM productos INNER JOIN categorias USING(id_categoria) WHERE nombre_producto LIKE ? OR descripcion_producto LIKE ? ORDER BY nombre_producto';
		$params = array("%$value%", "%$value%");
		return Conexion::getRows($sql, $params);
	}

	public function readCategorias()
	{
		$sql = 'SELECT id_categoria, nombre_categoria, imagen_categoria, descripcion_categoria FROM categorias';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}

	public function createProducto()
	{
		$sql = 'INSERT INTO productos(nombre_producto, descripcion_producto, precio_producto, imagen_producto, estado_producto, id_categoria) VALUES(?, ?, ?, ?, ?, ?)';
		$params = array($this->nombre, $this->descripcion, $this->precio, $this->imagen, $this->estado, $this->categoria);
		return Conexion::executeRow($sql, $params);
	}

	public function getProducto()
	{
		$sql = 'SELECT id_producto, nombre_producto, descripcion_producto, precio_producto, imagen_producto, id_categoria, estado_producto FROM productos WHERE id_producto = ?';
		$params = array($this->id);
		return Conexion::getRow($sql, $params);
	}

	public function updateProducto()
	{
		$sql = 'UPDATE productos SET nombre_producto = ?, descripcion_producto = ?, precio_producto = ?, imagen_producto = ?, estado_producto = ?, id_categoria = ? WHERE id_producto = ?';
		$params = array($this->nombre, $this->descripcion, $this->precio, $this->imagen, $this->estado, $this->categoria, $this->id);
		return Conexion::executeRow($sql, $params);
	}

	public function deleteProducto()
	{
		$sql = 'DELETE FROM productos WHERE id_producto = ?';
		$params = array($this->id);
		return Conexion::executeRow($sql, $params);
	}
	public function Graphics()
	{
		$sql = 'SELECT Nombre_categoria as categoria, Count(id_producto) as cantidad FROM productos INNER JOIN categorias USING(id_categoria) GROUP BY id_categoria';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}
	public function Ganancias()
	{
		$sql = 'SELECT Nombre_producto,Sum(cantidad) as Cantidad ,SUM(cantidad)*Precio_producto as Ganancia from detalle_pedido INNER JOIN productos on detalle_pedido.id_producto = productos.id_producto GROUP by Nombre_producto';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}

	public function Graphics3()
	{
		$sql = 'SELECT Nombre_producto as producto, Count(Cantidad) as cantidad FROM detalle_pedido INNER JOIN productos USING(id_producto) GROUP BY id_producto';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}
	public function Graphics4()
	{
		$sql = 'SELECT Nombre_producto as producto, SUM(cantidad) as Cantidad, SUM(cantidad)*Precio_producto as Ganancia from detalle_pedido INNER JOIN productos on detalle_pedido.id_producto = productos.id_producto GROUP by Nombre_producto';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}
	public function Graphics5()
	{
		$sql = 'SELECT Nombre_producto as productos, SUM(Precio_producto) as ganancia FROM productos  GROUP BY Nombre_producto DESC';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}
}
	public function Bitacora()
	{
		$sql = 'SELECT Producto, Fecha, Accion FROM bitacora';
		$params = array(null);
		return Conexion::getRows($sql, $params);
	}
}
?>
