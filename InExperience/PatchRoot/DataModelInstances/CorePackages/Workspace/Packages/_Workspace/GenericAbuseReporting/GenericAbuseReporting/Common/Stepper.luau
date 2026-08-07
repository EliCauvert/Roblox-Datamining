local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

local function validateSteps(p0) --[[ line: 58 ]]
	if not p0 or type(p0) ~= "table" then
		return "Steps must not be nil and be a table", false
	end
	for i, v in pairs(p0) do
		if i ~= v.stepId then
			return `Step id mismatch: key {i} does not match step.stepId {v.stepId}`, false
		end
	end
	return "", true
end

return reactModule.memo(function(p1) --[[ line: 70 | named "Stepper" ]]
	-- upvalues: reactModule (ref), validateSteps (ref), cryoModule (ref), view (ref), button (ref), buttonVariant (ref)
	local var4, var5 = reactModule.useState(p1.currentStep)
	local var6, var7 = reactModule.useState({ p1.currentStep })
	local var8 = reactModule.useCallback(function(p2) --[[ line: 74 ]]
		-- upvalues: p1 (ref)
		if p1.onErrorCallback then
			p1.onErrorCallback(p2)
			
			return
		end
		warn(p2)
	end, { p1.onErrorCallback })
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: validateSteps (copy), p1 (ref), var8 (ref)
		local var11, var12 = validateSteps(p1.steps)
		
		if not var12 then
			var8(var11)
		end
	end, { p1.steps, p1.onErrorCallback, var8 })
	local var9 = reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: p1 (ref), var4 (ref)
		return p1.steps and p1.steps[var4]
	end, { var4, p1.steps })
	local var10 = reactModule.useCallback(function(p3) --[[ line: 95 ]]
		-- upvalues: p1 (ref), var5 (ref), var6 (ref), var7 (ref), cryoModule (copy)
		if not p1.steps[p3] then
			return false
		end
		var5(p3)
		local index = table.find(var6, p3)
		
		if index then
			var7(function(p4) --[[ line: 105 ]]
				-- upvalues: cryoModule (copy), index (ref)
				return if #p4 == 0 then p4 else cryoModule.List.removeRange(p4, index + 1, #p4)
			end)
		else
			var7(function(p5) --[[ line: 112 ]]
				-- upvalues: p3 (ref)
				local cloned = table.clone(p5)
				table.insert(cloned, p3)
				
				return cloned
			end)
		end
		return true
	end, { p1.steps, var6 })
	
	return if var9 == nil then nil else reactModule.createElement(view, { tag = "auto-xy col flex-between" }, {
		ContentContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 0 }, var9.content),
		ButtonRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-y-small gap-small row {var9.stepStyle and var9.stepStyle.buttonXAlignment}`
		}, {
			BackButton = if var9.labels and var9.labels.backButton then reactModule.createElement(button, {
				LayoutOrder = 0,
				onActivated = reactModule.useCallback(function() --[[ line: 136 ]]
					-- upvalues: var6 (ref), var10 (ref), var9 (ref)
					local var15 = var6[#var6 - 1]
					
					if var15 and var10(var15) and (var9 and var9.onStepCancel) then
						var9.onStepCancel()
					end
				end, { var6, var9, var10 }),
				text = var9.labels.backButton,
				variant = var9.stepStyle and (var9.stepStyle.backButton and (var9.stepStyle.backButton.variant or buttonVariant.Text)),
				fillBehavior = var9.stepStyle and (var9.stepStyle.backButton and (var9.stepStyle.backButton.fillBehavior or nil))
			}) else nil,
			ContinueButton = if var9.labels and var9.labels.continueButton then reactModule.createElement(button, {
				LayoutOrder = 1,
				onActivated = reactModule.useCallback(function() --[[ line: 122 ]]
					-- upvalues: var9 (ref), var10 (ref)
					if not var9 or var9.validateState and not var9.validateState() then return end
					if var10(var9.predefinedNextStepId) and var9.onStepContinue then
						var9.onStepContinue()
					end
				end, { var9, var10 }),
				text = var9.labels.continueButton,
				variant = var9.stepStyle and (var9.stepStyle.continueButton and (var9.stepStyle.continueButton.variant or buttonVariant.Standard)),
				fillBehavior = var9.stepStyle and (var9.stepStyle.continueButton and (var9.stepStyle.continueButton.fillBehavior or nil))
			}) else nil
		}),
		FooterContainer = if var9.footer then reactModule.createElement(view, { tag = "size-full-0 auto-y col", LayoutOrder = 2 }, {
			Divider = reactModule.createElement(view, {
				tag = "size-full-50 bg-shift-100 padding-bottom-medium",
				LayoutOrder = 0
			}),
			Footer = reactModule.createElement(view, { tag = "auto-xy padding-top-medium" }, var9.footer)
		}) else nil
	})
end)