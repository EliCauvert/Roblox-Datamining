local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local inspect = require(parent.LuauPolyfill).util.inspect
local reactRobloxModule = require(parent.ReactRoblox)
local warnOnceModule = require(script.Parent.warnOnce)

return {
	mount = function(p1, p2, p3)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), inspect (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("mount", "Please use the createRoot API in ReactRoblox")
		end
		if p2 ~= nil and typeof(p2) ~= "Instance" then
			error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", if p1 then tostring(p1.type) else "<unknown>", typeof(p2), (function()
				-- upvalues: p2 (write), inspect (copy)
				return if p2 == nil then "" else inspect(p2)
			end)()))
		end
		local var1 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then reactRobloxModule.createLegacyRoot(Instance.new("Folder")) else reactRobloxModule.createRoot(Instance.new("Folder"))
		
		if p2 == nil then
			local target = Instance.new("Folder")
			target.Name = "Target"
			p2 = target
		end
		if p3 == nil then
			p3 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then "ReactLegacyRoot" else "ReactRoot"
		end
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: var1 (write), reactRobloxModule (copy), p3 (write), p1 (ref), p2 (write)
				var1:render(reactRobloxModule.createPortal({ [p3] = p1 }, p2))
			end)
		else
			var1:render(reactRobloxModule.createPortal({ [p3] = p1 }, p2))
		end
		return { root = var1, parent = p2, key = p3 }
	end,
	update = function(p1, p2)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("update", "Please use the createRoot API in ReactRoblox")
		end
		local key = p1.key
		local parent = p1.parent
		
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: p1 (ref), reactRobloxModule (copy), key (ref), p2 (ref), parent (ref)
				p1.root:render(reactRobloxModule.createPortal({ [key] = p2 }, parent))
			end)
			
			return p1
		end
		p1.root:render(reactRobloxModule.createPortal({ [key] = p2 }, parent))
		
		return p1
	end,
	unmount = function(p1)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("unmount", "Please use the createRoot API in ReactRoblox")
		end
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: p1 (ref)
				p1.root:unmount()
			end)
			
			return
		end
		p1.root:unmount()
	end
}