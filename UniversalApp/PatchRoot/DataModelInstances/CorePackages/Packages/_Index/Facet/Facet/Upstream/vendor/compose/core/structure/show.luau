local OwnerModule = require("../ownership/owner")
local _ = require("../runtime/children")
local _ = require("../host")
local SupportModule = require("./support")
local _ = require("../reactive/types")

return function(p1, p2, p3)
	-- upvalues: SupportModule (copy), OwnerModule (copy)
	local Show = SupportModule.sourceOf(p1, "show", "condition")
	local Show1 = SupportModule.builderOf(p2, "show", "builder")
	local Show2 = if p3 == nil then nil else SupportModule.builderOf(p3, "show", "fallback")
	
	return function(p4)
		-- upvalues: SupportModule (upval), OwnerModule (upval), Show (copy), Show1 (copy), Show2 (copy)
		local Show3 = SupportModule.ownerFor("show")
		SupportModule.mountPointOf(p4, "show")
		local Show4 = nil
		local v1 = nil
		OwnerModule.watch(Show3, function(p5)
			-- upvalues: Show (upval), v1 (ref), Show4 (ref), Show1 (upval), Show2 (upval), SupportModule (upval), p4 (copy), Show3 (copy)
			local Inverted = not not Show(p5)
			
			if Inverted == v1 then return end
			v1 = Inverted
			
			if Show4 ~= nil then
				Show4()
				Show4 = nil
			end
			local Show5 = if Inverted then Show1 else Show2
			
			if Show5 ~= nil then
				Show4 = SupportModule.mountBuilder(p4, Show3, Show5, "show")
				
				return
			end
		end)
	end
end