local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

local function validateSteps(p1)
	if not p1 or type(p1) ~= "table" then
		return "Steps must not be nil and be a table", false
	end
	for i, v in pairs(p1) do
		if i ~= v.stepId then
			return `Step id mismatch: key {i} does not match step.stepId {v.stepId}`, false
		end
	end
	return "", true
end

return reactModule.memo(function(p2)
	-- upvalues: reactModule (ref), validateSteps (ref), cryoModule (ref), view (ref), button (ref), buttonVariant (ref)
	local var1, var2 = reactModule.useState(p2.currentStep)
	local var3, var4 = reactModule.useState({ p2.currentStep })
	local var5 = reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref)
		if p2.onErrorCallback then
			p2.onErrorCallback(p3)
			
			return
		end
		warn(p3)
	end, { p2.onErrorCallback })
	reactModule.useEffect(function()
		-- upvalues: validateSteps (copy), p2 (ref), var5 (ref)
		local var6, var7 = validateSteps(p2.steps)
		
		if not var7 then
			var5(var6)
		end
	end, { p2.steps, p2.onErrorCallback, var5 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var1 (ref)
		return p2.steps and p2.steps[var1]
	end, { var1, p2.steps })
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref), var2 (ref), var3 (ref), var4 (ref), cryoModule (copy)
		if not p2.steps[p3] then
			return false
		end
		var2(p3)
		local index = table.find(var3, p3)
		
		if index then
			var4(function(p4)
				-- upvalues: cryoModule (copy), index (ref)
				return if #p4 == 0 then p4 else cryoModule.List.removeRange(p4, index + 1, #p4)
			end)
		else
			var4(function(p4)
				-- upvalues: p3 (ref)
				local cloned = table.clone(p4)
				table.insert(cloned, p3)
				
				return cloned
			end)
		end
		return true
	end, { p2.steps, var3 })
	
	return if var6 == nil then nil else reactModule.createElement(view, { tag = "auto-xy col flex-between" }, {
		ContentContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 0 }, var6.content),
		ButtonRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-y-small gap-small row {var6.stepStyle and var6.stepStyle.buttonXAlignment}`
		}, {
			BackButton = if var6.labels and var6.labels.backButton then reactModule.createElement(button, {
				LayoutOrder = 0,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var3 (ref), var7 (ref), var6 (ref)
					local var8 = var3[#var3 - 1]
					
					if var8 and var7(var8) and (var6 and var6.onStepCancel) then
						var6.onStepCancel()
					end
				end, { var3, var6, var7 }),
				text = var6.labels.backButton,
				variant = var6.stepStyle and (var6.stepStyle.backButton and (var6.stepStyle.backButton.variant or buttonVariant.Text)),
				fillBehavior = var6.stepStyle and (var6.stepStyle.backButton and (var6.stepStyle.backButton.fillBehavior or nil))
			}) else nil,
			ContinueButton = if var6.labels and var6.labels.continueButton then reactModule.createElement(button, {
				LayoutOrder = 1,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var6 (ref), var7 (ref)
					if not var6 or var6.validateState and not var6.validateState() then return end
					if var7(var6.predefinedNextStepId) and var6.onStepContinue then
						var6.onStepContinue()
					end
				end, { var6, var7 }),
				text = var6.labels.continueButton,
				variant = var6.stepStyle and (var6.stepStyle.continueButton and (var6.stepStyle.continueButton.variant or buttonVariant.Standard)),
				fillBehavior = var6.stepStyle and (var6.stepStyle.continueButton and (var6.stepStyle.continueButton.fillBehavior or nil))
			}) else nil
		}),
		FooterContainer = if var6.footer then reactModule.createElement(view, { tag = "size-full-0 auto-y col", LayoutOrder = 2 }, {
			Divider = reactModule.createElement(view, {
				tag = "size-full-50 bg-shift-100 padding-bottom-medium",
				LayoutOrder = 0
			}),
			Footer = reactModule.createElement(view, { tag = "auto-xy padding-top-medium" }, var6.footer)
		}) else nil
	})
end)