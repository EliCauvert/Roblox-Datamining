local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local RestoreSelectionIfStrandedModule = require(script.Parent.restoreSelectionIfStranded)

local function _(Callback)
	return if type(Callback) == "function" then Callback() else Callback.current
end

return function(p1)
	-- upvalues: GuiService (copy), ReactModule (copy), RestoreSelectionIfStrandedModule (copy)
	local GuiService1 = p1.guiService or GuiService
	local Enabled = p1.enabled
	local Active = p1.active
	local RearmKey = p1.rearmKey
	local RestoreHome = p1.restoreHome
	local UseRefResult = ReactModule.useRef(p1.edges)
	UseRefResult.current = p1.edges
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), Active (copy), UseRefResult (copy)
		if not Enabled or not Active then return end
		local Flag = false
		local List = {}
		task.delay(0, function()
			-- upvalues: Flag (ref), UseRefResult (upval), List (copy)
			if Flag then return end
			for _, value in UseRefResult.current do
				local FromFunction = value.from
				local FromResult = if type(FromFunction) == "function" then FromFunction() else FromFunction.current
				local ToFunction = value.to
				local ToResult = if type(ToFunction) == "function" then ToFunction() else ToFunction.current
				
				if FromResult and ToResult then
					local Text = "NextSelection" .. value.direction
					FromResult[Text] = ToResult
					table.insert(List, { from = FromResult, prop = Text })
				end
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), List (copy)
			Flag = true
			
			for _, value in List do
				pcall(function()
					-- upvalues: value (copy)
					value.from[value.prop] = nil
				end)
			end
		end
	end, { Enabled, Active, RearmKey or "", GuiService1 })
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), UseRefResult1 (copy), Active (copy), RestoreSelectionIfStrandedModule (upval), GuiService1 (copy), RestoreHome (copy)
		if Enabled and UseRefResult1.current and not Active then
			RestoreSelectionIfStrandedModule(GuiService1, if RestoreHome then RestoreHome.current else nil)
		end
		UseRefResult1.current = Active
		
		return nil
	end, { Enabled, Active, RestoreHome, GuiService1 })
end