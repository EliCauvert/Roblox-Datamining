local ChildrenModule = require("../runtime/children")
local Block = ChildrenModule.block
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local NodesModule = require("../ownership/nodes")
local SupportModule = require("./support")

return function(p1, p2)
	-- upvalues: DiagnosticsModule (copy), SupportModule (copy), NodesModule (copy), ChildrenModule (copy), Block (copy)
	if type(p1) == "table" or type(p1) == "userdata" then
		local Portal = SupportModule.builderOf(p2, "portal", "builder")
		
		return function(p3)
			-- upvalues: SupportModule (upval), NodesModule (upval), p1 (copy), ChildrenModule (upval), Block (upval), Portal (copy)
			local Portal1 = SupportModule.ownerFor("portal")
			SupportModule.mountPointOf(p3, "portal")
			NodesModule.markBorrowed(p1)
			Block.mountBlock(ChildrenModule.wholeOf(p3.host, p1), Portal1, Portal, Block.nameOf(Portal), nil)
		end
	else
		return DiagnosticsModule.raise("mount/target-not-a-node", "portal expects a host node to mount into", {
			expected = "a node belonging to the host this runtime renders to",
			contract = "a portal's target is borrowed: Compose adds to it and leaves it standing",
			fix = "pass the layer node itself, e.g. portal(screenLayer, function() ... end)",
			actual = DiagnosticsModule.describe(p1)
		})
	end
end