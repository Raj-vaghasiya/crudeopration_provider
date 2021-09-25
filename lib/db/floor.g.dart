// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder {
  _$UserDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$UserDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDAO? _userDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fristName` TEXT, `lastName` TEXT, `email` TEXT, `password` TEXT, `gender` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDAO get userDAO {
    return _userDAOInstance ??= _$UserDAO(database, changeListener);
  }
}

class _$UserDAO extends UserDAO {
  _$UserDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'fristName': item.fristName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'password': item.password,
                  'gender': item.gender
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<List<User>> getAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            fristName: row['fristName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            gender: row['gender'] as String?));
  }

  @override
  Future<void> getAllUserById(int id) async {
    await _queryAdapter
        .queryNoReturn('SELECT * FROM User  WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteAllUser() async {
    await _queryAdapter.queryNoReturn('SELECT * FROM User');
  }

  @override
  Future<List<User>> updateForEdit(
      String fName, String lastName, String email, int id) async {
    return _queryAdapter.queryList(
        'UPDATE User SET fristName = ?1 , lastName = ?2 , email = ?3 WHERE id = ?4',
        mapper: (Map<String, Object?> row) => User(id: row['id'] as int?, fristName: row['fristName'] as String?, lastName: row['lastName'] as String?, email: row['email'] as String?, password: row['password'] as String?, gender: row['gender'] as String?),
        arguments: [fName, lastName, email, id]);
  }

  @override
  Future<List<User>> updateForPassword(String password, int id) async {
    return _queryAdapter.queryList('UPDATE User SET password = ?1 WHERE id =?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            fristName: row['fristName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            gender: row['gender'] as String?),
        arguments: [password, id]);
  }

  @override
  Future<List<User>> loginData(String email, String password) async {
    return _queryAdapter.queryList(
        'SELECT * FROM User WHERE email = ?1  AND password = ?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            fristName: row['fristName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            gender: row['gender'] as String?),
        arguments: [email, password]);
  }

  @override
  Future<List<User>> emailData(String email) async {
    return _queryAdapter.queryList('SELECT  * FROM User WHERE email = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            fristName: row['fristName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            gender: row['gender'] as String?),
        arguments: [email]);
  }

  @override
  Future<void> deleteUser(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM User WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<List<int>> inserttUser(List<User> user) {
    return _userInsertionAdapter.insertListAndReturnIds(
        user, OnConflictStrategy.abort);
  }
}
