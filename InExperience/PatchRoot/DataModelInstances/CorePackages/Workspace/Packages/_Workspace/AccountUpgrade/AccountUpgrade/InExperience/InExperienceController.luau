local coreGuiService = game:GetService("CoreGui")
local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local t = {
	[require(accountUpgrade.AccountUpgradeFlow).Pioneer] = {
		canDismiss = true,
		getView = function()
			return require(script.Parent.AccountUpgradePromptApp)
		end
	}
}
local var1 = nil
local var2 = nil
local t_1 = {}

local function _(p1, p2)
	-- upvalues: var2 (write), var1 (write)
	return var2 == p1 and var1 == p2
end

local function cleanupHost(p1, p2)
	-- upvalues: var2 (write), var1 (write)
	if not (var2 == p1 and var1 == p2) then return end
	var2 = nil
	var1 = nil
	
	if p1 then
		pcall(function()
			-- upvalues: p1 (ref)
			p1:unmount()
		end)
	end
	if p2 then
		p2:Destroy()
	end
end

function t_1.unmount()
	-- upvalues: cleanupHost (ref), var2 (write), var1 (write)
	cleanupHost(var2, var1)
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: var2 (write), var1 (write), cleanupHost (ref)
	task.defer(function()
		-- upvalues: p1 (ref), p2 (ref), var2 (copy), var1 (copy), cleanupHost (copy), p3 (ref), p4 (ref)
		if not (var2 == p1 and var1 == p2) then return end
		cleanupHost(p1, p2)
		
		if p3 then
			p3(p4)
		end
	end)
end

local _ = function()
	-- upvalues: var2 (write), var1 (write), coreGuiService (ref)
	return var2 ~= nil and (var1 ~= nil and var1.Parent == coreGuiService)
end

local _ = function()
	-- upvalues: var2 (write), var1 (write), coreGuiService (ref), t_1 (ref)
	if var2 ~= nil then
		if not (var2 ~= nil and (var1 ~= nil and var1.Parent == coreGuiService)) then
			t_1.unmount()
		end
	end
end

function t_1.mount(p1)
	-- upvalues: var2 (write), var1 (write), coreGuiService (ref), t_1 (ref), t (ref), reactRobloxModule (ref), cleanupHost (ref), reactModule (ref)
	if var2 ~= nil then
		if not (var2 ~= nil and (var1 ~= nil and var1.Parent == coreGuiService)) then
			t_1.unmount()
		end
	end
	if var2 ~= nil and (var1 ~= nil and var1.Parent == coreGuiService) then
		return "already_mounted"
	end
	local flow = t[p1.flow]
	
	if flow == nil then
		return "unsupported_flow"
	end
	local screenGui = Instance.new("ScreenGui")
	var1 = screenGui
	local var3 = nil
	local ok, status = pcall(function()
		-- upvalues: screenGui (ref), coreGuiService (copy), reactRobloxModule (copy), var3 (write), var2 (copy), p1 (ref), var1 (copy), cleanupHost (copy), flow (ref), reactModule (copy)
		screenGui.Name = "InExperienceAccountUpgradePrompt"
		screenGui.AutoLocalize = false
		screenGui.DisplayOrder = 6
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Parent = coreGuiService
		local var4 = reactRobloxModule.createRoot(screenGui)
		var3 = var4
		var2 = var4
		local var5 = false
		
		local _ = function(p2)
			-- upvalues: var5 (write), var4 (ref), screenGui (copy), p1 (copy), var2 (copy), var1 (copy), cleanupHost (copy)
			if var5 then
				return
			end
			var5 = true
			local onComplete = p1.onComplete
			task.defer(function()
				-- upvalues: var4 (ref), screenGui (ref), var2 (copy), var1 (copy), cleanupHost (copy), onComplete (ref), p2 (ref)
				if not (var2 == var4 and var1 == screenGui) then return end
				cleanupHost(var4, screenGui)
				
				if onComplete then
					onComplete(p2)
				end
			end)
		end
		
		local var6 = function(p2)
			-- upvalues: var5 (write), var4 (ref), screenGui (copy), p1 (copy), var2 (copy), var1 (copy), cleanupHost (copy)
			local t = { reason = "success", result = p2 }
			
			if var5 then
				return
			end
			var5 = true
			local onComplete = p1.onComplete
			task.defer(function()
				-- upvalues: var4 (ref), screenGui (ref), var2 (copy), var1 (copy), cleanupHost (copy), onComplete (ref), t (ref)
				if not (var2 == var4 and var1 == screenGui) then return end
				cleanupHost(var4, screenGui)
				
				if onComplete then
					onComplete(t)
				end
			end)
		end
		
		var4:render(if flow.canDismiss then reactModule.createElement(flow.getView(), {
			onDismiss = function()
				-- upvalues: var5 (write), var4 (ref), screenGui (copy), p1 (copy), var2 (copy), var1 (copy), cleanupHost (copy)
				local t = { reason = "user_closed" }
				
				if var5 then
					return
				end
				var5 = true
				local onComplete = p1.onComplete
				task.defer(function()
					-- upvalues: var4 (ref), screenGui (ref), var2 (copy), var1 (copy), cleanupHost (copy), onComplete (ref), t (ref)
					if not (var2 == var4 and var1 == screenGui) then return end
					cleanupHost(var4, screenGui)
					
					if onComplete then
						onComplete(t)
					end
				end)
			end,
			onComplete = var6
		}) else reactModule.createElement(flow.getView(), { onComplete = var6 }))
	end)
	
	if not ok then
		cleanupHost(var3, screenGui)
		error(status, 0)
	end
	return "mounted"
end

return t_1