class Mutations {
  static const String addTransaction =
      """mutation insertTransaction(\$category_id: Int!, \$date: date!, \$description: String!, \$name: String!, \$price: numeric!, \$project_id: Int!) {
  insert_transactions_one(object: {category_id: \$category_id, date: \$date, description: \$description, name: \$name, price: \$price, project_id: \$project_id, status: 0, transaction_type: 1}) {
    id
    category_id
    date
    description
    name
    price
    project_id
    status
    transaction_type
  }
}""";
}
