local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local InspectFunction = require(Parent.LuauPolyfill).util.inspect
local ReactRobloxModule = require(Parent.ReactRoblox)
local WarnOnceModule = require(script.Parent.warnOnce)

return {
	mount = function(p1, Folder: Folder, Key: string) --[[ Line: 31 ]]
		-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), InspectFunction (copy), ReactRobloxModule (copy)
		if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
			WarnOnceModule("mount", "Please use the createRoot API in ReactRoblox")
		end
		if Folder ~= nil and typeof(Folder) ~= "Instance" then
			error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", if p1 then tostring(p1.type) else "<unknown>", typeof(Folder), (function() --[[ Line: 47 ]]
				-- upvalues: Folder (ref), InspectFunction (upval)
				return if Folder == nil then "" else InspectFunction(Folder)
			end)()))
		end
		local LegacyRoot = nil
		LegacyRoot = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then ReactRobloxModule.createLegacyRoot(Instance.new("Folder")) else ReactRobloxModule.createRoot(Instance.new("Folder"))
		
		if Folder == nil then
			local Target = Instance.new("Folder")
			Target.Name = "Target"
			Folder = Target
		end
		if Key == nil then
			Key = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then "ReactLegacyRoot" else "ReactRoot"
		end
		if ReactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			ReactRobloxModule.act(function() --[[ Line: 82 ]]
				-- upvalues: LegacyRoot (ref), ReactRobloxModule (upval), Key (ref), p1 (copy), Folder (ref)
				LegacyRoot:render(ReactRobloxModule.createPortal({ [Key] = p1 }, Folder))
			end)
		else
			LegacyRoot:render(ReactRobloxModule.createPortal({ [Key] = p1 }, Folder))
		end
		return { root = LegacyRoot, parent = Folder, key = Key }
	end,
	update = function(p1, p2) --[[ Line: 98 ]]
		-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), ReactRobloxModule (copy)
		if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
			WarnOnceModule("update", "Please use the createRoot API in ReactRoblox")
		end
		local Key = p1.key
		local Parent = p1.parent
		
		if ReactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			ReactRobloxModule.act(function() --[[ Line: 108 ]]
				-- upvalues: p1 (copy), ReactRobloxModule (upval), Key (copy), p2 (copy), Parent (copy)
				p1.root:render(ReactRobloxModule.createPortal({ [Key] = p2 }, Parent))
			end)
			
			return p1
		else
			p1.root:render(ReactRobloxModule.createPortal({ [Key] = p2 }, Parent))
			
			return p1
		end
	end,
	unmount = function(p1) --[[ Line: 122 ]]
		-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), ReactRobloxModule (copy)
		if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
			WarnOnceModule("unmount", "Please use the createRoot API in ReactRoblox")
		end
		if ReactGlobalsModule.__ROACT_17_INLINE_ACT__ then
			ReactRobloxModule.act(function() --[[ Line: 130 ]]
				-- upvalues: p1 (copy)
				p1.root:unmount()
			end)
			
			return
		else
			p1.root:unmount()
		end
	end
}