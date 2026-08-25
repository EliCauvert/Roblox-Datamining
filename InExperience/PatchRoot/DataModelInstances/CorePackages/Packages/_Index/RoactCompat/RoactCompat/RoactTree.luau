local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local inspect = require(parent.LuauPolyfill).util.inspect
local reactRobloxModule = require(parent.ReactRoblox)
local warnOnceModule = require(script.Parent.warnOnce)

return {
	mount = function(p0, p1, p2)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), inspect (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("mount", "Please use the createRoot API in ReactRoblox")
		end
		if p1 ~= nil and typeof(p1) ~= "Instance" then
			error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", if p0 then tostring(p0.type) else "<unknown>", typeof(p1), (function()
				-- upvalues: p1 (write), inspect (copy)
				return if p1 == nil then "" else inspect(p1)
			end)()))
		end
		local var3 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then reactRobloxModule.createLegacyRoot(Instance.new("Folder")) else reactRobloxModule.createRoot(Instance.new("Folder"))
		
		if p1 == nil then
			local target = Instance.new("Folder")
			target.Name = "Target"
			p1 = target
		end
		if p2 == nil then
			p2 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then "ReactLegacyRoot" else "ReactRoot"
		end
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: var3 (write), reactRobloxModule (copy), p2 (write), p0 (ref), p1 (write)
				var3:render(reactRobloxModule.createPortal({ [p2] = p0 }, p1))
			end)
		else
			var3:render(reactRobloxModule.createPortal({ [p2] = p0 }, p1))
		end
		return { root = var3, parent = p1, key = p2 }
	end,
	update = function(p3, p4)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("update", "Please use the createRoot API in ReactRoblox")
		end
		local key = p3.key
		local parent = p3.parent
		
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: p3 (ref), reactRobloxModule (copy), key (ref), p4 (ref), parent (ref)
				p3.root:render(reactRobloxModule.createPortal({ [key] = p4 }, parent))
			end)
			
			return p3
		end
		p3.root:render(reactRobloxModule.createPortal({ [key] = p4 }, parent))
		
		return p3
	end,
	unmount = function(p5)
		-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactRobloxModule (ref)
		if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
			warnOnceModule("unmount", "Please use the createRoot API in ReactRoblox")
		end
		if reactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			reactRobloxModule.act(function()
				-- upvalues: p5 (ref)
				p5.root:unmount()
			end)
			
			return
		end
		p5.root:unmount()
	end
}