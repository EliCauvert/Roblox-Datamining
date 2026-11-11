return function(p1, p2, p3)
	local Module = Instance.new("ModuleScript")
	Module.Source = ("\tlocal Root = script:FindFirstAncestor(\"JestConfigs\")\n\tlocal Packages = Root.Parent\n\t\n\tlocal JestGlobals = require(Packages.JestGlobals)\n\tlocal beforeAll = JestGlobals.beforeAll\n\tlocal afterAll = JestGlobals.afterAll\n\tlocal expect = JestGlobals.expect\n\t\n\tlocal UnitTestHelpersPromiseRejectionHandler = require(Packages.UnitTestHelpersPromiseRejectionHandler)\n\tlocal createPromiseRejectionHandler = UnitTestHelpersPromiseRejectionHandler.createPromiseRejectionHandler\n\n\tlocal RejectionHandler = createPromiseRejectionHandler()\n\t\n\tbeforeAll(function()\n\t\tRejectionHandler.inject()\n\tend)\n\t\n\tafterAll(function()\n\t\texpect(function()\n\t\t\tRejectionHandler.reportRejections(%s, %s, %s)\n\t\tend).never.toThrow()\n\tend)\n"):format(tostring(p1), tostring(p2), (tostring(p3)))
	Module.Parent = script.Parent
	
	return Module
end