local CoreGui = game:GetService("CoreGui")
local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local config = {
	[require(AccountUpgrade.AccountUpgradeFlow).Pioneer] = {
		canDismiss = true,
		getView = function() --[[ Line: 62 ]]
			return (require(script.Parent.AccountUpgradePromptApp))
		end
	}
}
local ScreenGui = nil
local Root = nil

local function _(p1, p2): boolean --[[ Line: 73 | Named "isCurrentHost" ]]
	-- upvalues: Root (ref), ScreenGui (ref)
	return Root == p1 and ScreenGui == p2
end

local function cleanupHost(Root1, ScreenGui1) --[[ Line: 77 ]]
	-- upvalues: Root (ref), ScreenGui (ref)
	if Root ~= Root1 or ScreenGui ~= ScreenGui1 then return end
	Root = nil
	ScreenGui = nil
	
	if Root1 then
		pcall(function() --[[ Line: 86 ]]
			-- upvalues: Root1 (copy)
			Root1:unmount()
		end)
	end
	if ScreenGui1 then
		ScreenGui1:Destroy()
	end
end

local InExperienceController = {
	unmount = function() --[[ Line: 95 ]]
		-- upvalues: cleanupHost (copy), Root (ref), ScreenGui (ref)
		cleanupHost(Root, ScreenGui)
	end
}

local _ = function(p1, p2, p3, p4) --[[ Line: 99 | Named "completeAfterCurrentEvent" ]]
	-- upvalues: Root (ref), ScreenGui (ref), cleanupHost (copy)
	task.defer(function() --[[ Line: 105 ]]
		-- upvalues: p1 (copy), p2 (copy), Root (upval), ScreenGui (upval), cleanupHost (upval), p3 (copy), p4 (copy)
		if Root ~= p1 or ScreenGui ~= p2 then return end
		cleanupHost(p1, p2)
		
		if p3 then
			p3(p4)
		end
	end)
end

local _ = function(): boolean --[[ Line: 118 | Named "isMounted" ]]
	-- upvalues: Root (ref), ScreenGui (ref), CoreGui (copy)
	return Root ~= nil and (ScreenGui ~= nil and ScreenGui.Parent == CoreGui)
end

local _ = function() --[[ Line: 122 | Named "unmountStaleHost" ]]
	-- upvalues: Root (ref), ScreenGui (ref), CoreGui (copy), InExperienceController (copy)
	if Root ~= nil and (Root == nil or (ScreenGui == nil or ScreenGui.Parent ~= CoreGui)) then
		InExperienceController.unmount()
	end
end

function InExperienceController.mount(p1): string --[[ Line: 128 ]]
	-- upvalues: Root (ref), ScreenGui (ref), CoreGui (copy), InExperienceController (copy), config (copy), ReactRobloxModule (copy), cleanupHost (copy), ReactModule (copy)
	if Root ~= nil and (Root == nil or (ScreenGui == nil or ScreenGui.Parent ~= CoreGui)) then
		InExperienceController.unmount()
	end
	if Root ~= nil and (ScreenGui ~= nil and ScreenGui.Parent == CoreGui) then
		return "already_mounted"
	end
	local Entry = config[p1.flow]
	
	if Entry == nil then
		return "unsupported_flow"
	end
	local ScreenGui1 = Instance.new("ScreenGui")
	ScreenGui = ScreenGui1
	local v1 = nil
	local Success, Result = pcall(function() --[[ Line: 145 ]]
		-- upvalues: ScreenGui1 (copy), CoreGui (upval), ReactRobloxModule (upval), v1 (ref), Root (upval), p1 (copy), ScreenGui (upval), cleanupHost (upval), Entry (copy), ReactModule (upval)
		ScreenGui1.Name = "InExperienceAccountUpgradePrompt"
		ScreenGui1.AutoLocalize = false
		ScreenGui1.DisplayOrder = 6
		ScreenGui1.IgnoreGuiInset = true
		ScreenGui1.ResetOnSpawn = false
		ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		ScreenGui1.Parent = CoreGui
		local Root1 = ReactRobloxModule.createRoot(ScreenGui1)
		v1 = Root1
		Root = Root1
		local Flag = false
		
		local function _(p2) --[[ Line: 158 ]]
			-- upvalues: Flag (ref), Root1 (copy), ScreenGui1 (upval), p1 (upval), Root (upval), ScreenGui (upval), cleanupHost (upval)
			if not Flag then
				Flag = true
				local OnComplete = p1.onComplete
				task.defer(function() --[[ Line: 105 ]]
					-- upvalues: Root1 (copy), ScreenGui1 (copy), Root (upval), ScreenGui (upval), cleanupHost (upval), OnComplete (copy), p2 (copy)
					if Root ~= Root1 or ScreenGui ~= ScreenGui1 then return end
					cleanupHost(Root1, ScreenGui1)
					
					if OnComplete then
						OnComplete(p2)
					end
				end)
				
				return
			end
		end
		
		local function OnComplete(Result) --[[ Line: 165 ]]
			-- upvalues: Flag (ref), Root1 (copy), ScreenGui1 (upval), p1 (upval), Root (upval), ScreenGui (upval), cleanupHost (upval)
			local config = { reason = "success", result = Result }
			
			if not Flag then
				Flag = true
				local OnComplete = p1.onComplete
				task.defer(function() --[[ Line: 105 ]]
					-- upvalues: Root1 (copy), ScreenGui1 (copy), Root (upval), ScreenGui (upval), cleanupHost (upval), OnComplete (copy), config (copy)
					if Root ~= Root1 or ScreenGui ~= ScreenGui1 then return end
					cleanupHost(Root1, ScreenGui1)
					
					if OnComplete then
						OnComplete(config)
					end
				end)
				
				return
			end
		end
		
		Root1:render(if Entry.canDismiss then ReactModule.createElement(Entry.getView(), {
			flow = p1.flow,
			onDismiss = function() --[[ Line: 177 ]]
				-- upvalues: Flag (ref), Root1 (copy), ScreenGui1 (upval), p1 (upval), Root (upval), ScreenGui (upval), cleanupHost (upval)
				local config = { reason = "user_closed" }
				
				if not Flag then
					Flag = true
					local OnCompleteFunction = p1.onComplete
					task.defer(function() --[[ Line: 105 ]]
						-- upvalues: Root1 (copy), ScreenGui1 (copy), Root (upval), ScreenGui (upval), cleanupHost (upval), OnCompleteFunction (copy), config (copy)
						if Root ~= Root1 or ScreenGui ~= ScreenGui1 then return end
						cleanupHost(Root1, ScreenGui1)
						
						if OnCompleteFunction then
							OnCompleteFunction(config)
						end
					end)
					
					return
				end
			end,
			onComplete = OnComplete
		}) else ReactModule.createElement(Entry.getView(), { flow = p1.flow, onComplete = OnComplete }))
	end)
	
	if not Success then
		cleanupHost(v1, ScreenGui1)
		error(Result, 0)
	end
	return "mounted"
end

return InExperienceController