class Querys {
  static const String readUsers = """query getUser {
  users(where: {id: {_eq: 1}}) {
    company_id
    email
    name
  }
}""";
  static const String getProjects = """query getProjects {
  projects(where: {user_projects: {user_id: {_eq: 1}}}) {
    name
    id
  }
}""";
  static const String signIn =
      """query signIn(\$email: String, \$password: String) {
  users(where: {email: {_eq: \$email}, password: {_eq: \$password}}) {
    company_id
    email
    name
    id
  }
}
""";
}
