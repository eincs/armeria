namespace java com.linecorp.armeria.service.test.thrift.main

// Tests a non-oneway method with a return value.
service HelloService {
    string hello(1:string name)
}

// Tests one-way method.
service OnewayHelloService {
    oneway void hello(1:string name)
}

// Tests non-oneway method with void return value.
service DevNullService {
    void consume(1:string value)
}

// Tests method wihout parameter
service TimeService {
    i64 getServerTime()
}

// Tests exception handling.
exception FileServiceException {}
service FileService {
    void create(1:string path) throws (1:FileServiceException ouch)
}

// Tests structs and lists.
struct Name {
    1: string first
    2: string middle
    3: string last
}

service NameService {
    Name removeMiddle(1:Name name)
}

service NameSortService {
    list<Name> sort(1:list<Name> names)
}

// Tests out-of-order responses
service SleepService {
    i64 sleep(1:i64 delay)
}

exception FooServiceException {
    1: string stringVal,
}

enum FooEnum {
    VAL1 = 1,
    VAL2 = 2,
    VAL3 = 3,
}

union FooUnion {
    1: string stringVal,
    2: FooEnum enumVal,
}

struct FooStruct {
    1: bool boolVal,
    2: byte byteVal,
    3: i16 i16Val,
    4: i32 i32Val,
    5: i64 i64Val,
    6: double doubleVal,
    7: string stringVal,
    8: binary binaryVal,
    9: slist slistVal,
    10: FooEnum enumVal,
    11: FooUnion unionVal,
    12: map<string, FooEnum> mapVal,
    13: set<FooUnion> setVal,
    14: list<string> listVal,
}

service FooService {
    void bar1() throws (1: FooServiceException e),
    string bar2() throws (1: FooServiceException e),
    FooStruct bar3(1: i32 intVal, 2: FooStruct foo) throws (1: FooServiceException e),
    list<FooStruct> bar4(list<FooStruct> foos) throws (1: FooServiceException e),
    map<string, FooStruct> bar5(map<string, FooStruct> foos) throws (1: FooServiceException e)
}
