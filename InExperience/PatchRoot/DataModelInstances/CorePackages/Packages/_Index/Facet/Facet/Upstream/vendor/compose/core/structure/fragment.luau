local Block = require("../runtime/children").block
local _ = require("../host")
local SupportModule = require("./support")

return function(p1)
	-- upvalues: SupportModule (copy), Block (copy)
	local Fragment = SupportModule.builderOf(p1, "fragment", "builder")
	
	return function(p2)
		-- upvalues: SupportModule (upval), Block (upval), Fragment (copy)
		local Fragment1 = SupportModule.ownerFor("fragment")
		SupportModule.mountPointOf(p2, "fragment")
		Block.mountBlock(p2, Fragment1, Fragment, Block.nameOf(Fragment), 1)
	end
end