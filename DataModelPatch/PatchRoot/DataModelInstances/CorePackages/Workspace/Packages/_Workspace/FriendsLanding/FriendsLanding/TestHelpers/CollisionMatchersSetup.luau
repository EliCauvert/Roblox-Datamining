local DevDependenciesModule = require(script:FindFirstAncestor("FriendsLanding").devDependencies)
DevDependenciesModule.JestGlobals.expect.extend(DevDependenciesModule.CollisionMatchers.Jest)