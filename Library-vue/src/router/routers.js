export default [
    // home
    {
        path: "/home",
        component: (resolve) => require(["@/pages/home/Home"], resolve),
    },
    {
        path: "/",
        component: (resolve) => require(["@/pages/home/Home"], resolve),
    },

    {
        path: "/civil-engineering",
        component: (resolve) => require(["@/pages/colleges/CivilEngineering"], resolve),
    },
    // 电气与信息工程学院
    {
        path: "/electrical-info-eng",
        component: (resolve) => require(["@/pages/colleges/ElectricalInfoEng"], resolve),
    },
    // 交通运输工程学院
    {
        path: "/transport-engineering",
        component: (resolve) => require(["@/pages/colleges/TransportEngineering"], resolve),
    },
    // 汽车与机械工程学院
    {
        path: "/auto-mech-engineering",
        component: (resolve) => require(["@/pages/colleges/AutoMechEngineering"], resolve),
    },
    // school
    {
        path: "school",
        component: (resolve) =>
            require(["@/pages/school/School"], resolve),
    },
    {
        path: "notification",
        component: (resolve) =>
            require(["@/pages/school/Notification"], resolve),
    },
    {
        path: "library",
        component: (resolve) => require(["@/pages/school/Library"], resolve),
    },
    {
        path: "seat",
        component: (resolve) => require(["@/pages/school/Seat"], resolve),
    },

    // receive
    {
        path: "CatSeat",
        component: (resolve) => require(["@/pages/school/CatSeat"], resolve),
    },
    {
        path: "receive",
        component: (resolve) => require(["@/pages/receive/Receive"], resolve),
    },
    {
        path: "receivefast",
        component: (resolve) => require(["@/pages/receive/ReceiveFast"], resolve),
    },
    {
        path: "receiveRule",
        component: (resolve) =>
            require(["@/pages/receive/ReceiveRule"], resolve),
    },

    // credit
    {
        path: "credit",
        component: (resolve) => require(["@/pages/credit/Credit"], resolve),
    },
    // feedback
    {
        path: "feedback",
        component: (resolve) => require(["@/pages/feedback/Feedback"], resolve),
    },
    // user
    {
        path: "user",
        component: (resolve) => require(["@/pages/user/User"], resolve),
    },
    // settings
    {
        path: "settings",
        component: (resolve) => require(["@/pages/setting/Settings"], resolve),
    },
];
