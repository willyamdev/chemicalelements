class ChemicalElement {
  String _elementName; //Hoxigen, Gold..
  String _chemicalSymbol; // Br, Ue, H..
  int _elementType;
  String _description;

  ChemicalElement(this._elementName, this._chemicalSymbol, this._elementType,this._description);

  String get elementName => _elementName;
  String get chemicalSymbol => _chemicalSymbol;
  int get elementType => _elementType;
  String get description => _description;
}