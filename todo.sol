// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract todo {
//いいねボタン用にgoodというuint変数を追加しときました
  struct Todo {
    string contents;
    bool is_opened;
    bool is_deleted;
    uint good;
  }

  Todo[] public todos;

  // id と address の紐付け
  mapping (uint => address) public todoToOwner;
  mapping (address => uint) todoCountByOwner;

  // 自分のものだけ作業できるようにする
  modifier onlyMine(uint id) {
    require(todoToOwner[id] == msg.sender);
    _;
  }

  // すべての TODO を返却する
  // 疑問: address を引数にとらなくてもよい？
  // -> address を指定して関数を呼べてしまうと他人のTODOが見れるので駄目
  function getTODO() external view returns(uint[] memory) {

    // TODO の数が 0 ならからの配列を返す
    if (todoCountByOwner[msg.sender] == 0) {
      uint[] memory emptyArray = new uint[](0);
      return emptyArray;
    }

    // array は memory か storage か設定しないと駄目
    uint[] memory result = new uint[](todoCountByOwner[msg.sender]);
    uint counter = 0;

    for (uint i = 0; i < todos.length; i++) {
      //たぶんここじゃね？表示制限かけてるの
      if (todos[i].is_deleted == false) {
  //    if (todoToOwner[i] == msg.sender && todos[i].is_deleted == false) {
        result[counter] = i;
        counter++;
      }
    }

    return result;
  }

  // 引数から TODO を作成し storage に保存する
  function createTODO(string memory _contents) public returns(uint) {
    todos.push(Todo(_contents, true, false,0));
    uint id = todos.length - 1;
    todoToOwner[id] = msg.sender;

    // TODO 数を増やす
    todoCountByOwner[msg.sender]++;

    return id;
  }

  function updateTODO(uint _id, bool _is_opened) public onlyMine(_id) {
    // 指定の id の TODO をアップデートする
    todos[_id].is_opened = _is_opened;
  }

    //　
  ////  function updateall(uint _id, bool _is_opened) public {
  ////  todos[].is_opened = _is_opened;
  ////}

//実際にデータを削除しているわけではなく、Todo構造体のis_deletedというブール値を変更し、非表示にすることで、ぱっと見削除されているように見せかけている
//いいね機能の実装をする場合は、このコードが参考になると思う

  function deleteTODO(uint _id) public onlyMine(_id) {
    require(todos[_id].is_deleted == false);

    // 自分の TODO を削除する
    todos[_id].is_deleted = true;

    // TODO 数を減らす
    todoCountByOwner[msg.sender]--;
  }

}
