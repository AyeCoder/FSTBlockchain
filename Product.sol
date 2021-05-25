pragma solidity 0.8.0;

contract Product {
    
    // state variables
    enum ProductType {organic, nonOrganic}
    
    address public productAddress;
    string public productName;
    
    struct Buyier{
        string buyierName;
        uint buyiedProductCount;
    }
    mapping(address => Buyier) public buyiers;
    
    mapping(ProductType => uint) public productTypePrice;
    mapping(ProductType => uint) public availableProducts; 
    mapping(ProductType => uint) public deliveryFees ;
    
    struct Product{
        ProductType typeOfProduct;
        uint priceofProduct;
        bool isActive;
    }
    mapping(uint => Product) public products;
    uint public productCounter;
    
    // logic
    
   modifier onlyProduct() {
        require(msg.sender == productAddress, "Prouduct: user is not the buyier");
        _;
    }
    
    modifier allowedToAdd(ProductType _type) {
        require( productTypePrice[_type] != 0, "Product: Product price cannot be zero");
        _;
    }
    
    constructor (string memory _productName) {
        productAddress = msg.sender;
        productName = _productName;
    }
    
    function addProduct(ProductType _type, uint _quantity) public onlyProduct allowedToAdd(_type) {
        availableProducts[_type] += _quantity;
    }
    
    function setTypePrice(ProductType _type, uint _price) public onlyProduct {
        productTypePrice[_type] = _price;
    }
    
    function setdeliveryFees(ProductType _type, uint _deliveryFees) public onlyProduct {
        deliveryFees[_type] = _deliveryFees;
    }
    
}