local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local getFFlagIGMGamepadSelectionHistoryModule = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local focusHandlerContextModule = require(script.Parent.FocusHandlerUtils.FocusHandlerContext)
local var3 = 1
local focusHandler = roact.PureComponent:extend("FocusHandler")
focusHandler.validateProps = t.strictInterface({
	isFocused = t.boolean,
	didFocus = t.optional(t.callback),
	didBlur = t.optional(t.callback),
	shouldForgetPreviousSelection = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.boolean) or nil,
	currentHandlerId = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil,
	candidateHandlerId = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil,
	previousSelections = if getFFlagIGMGamepadSelectionHistoryModule() then t.table else nil,
	requestFocusForHandlerId = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	forgetLastSelectionForHandlerId = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	blurCurrentFocusHandler = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	[roact.Children] = t.optional(t.table)
})

if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.init(p0) --[[ line: 50 ]]
		-- upvalues: var3 (write)
		p0.id = var3
		var3 += 1
	end
end
function focusHandler.render(p1) --[[ line: 56 ]]
	-- upvalues: roact (ref)
	return roact.createFragment(p1.props[roact.Children])
end

if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.didMount(p2) --[[ line: 61 ]]
		if p2.props.isFocused then
			p2.props.requestFocusForHandlerId(p2.id)
		end
	end
else
	function focusHandler.didMount(p3) --[[ line: 67 ]]
		if p3.props.isFocused then
			p3.props.didFocus()
		end
	end
end
if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.didUpdate(p4, p5) --[[ line: 75 ]]
		local id = p4.props.previousSelections[p4.id]
		
		if p4.props.shouldForgetPreviousSelection and not p5.shouldForgetPreviousSelection or id ~= nil and not id:IsDescendantOf(game) then
			p4.props.forgetLastSelectionForHandlerId(p4.id)
			id = nil
		end
		local var5 = p4.props.candidateHandlerId ~= p4.id and p4.props.candidateHandlerId ~= nil
		local var6 = p5.candidateHandlerId ~= p4.id and p5.candidateHandlerId ~= nil
		local var7 = p4.props.currentHandlerId == p4.id and p5.currentHandlerId ~= p4.id
		local isFocused = (p4.props.currentHandlerId == nil and (p5.currentHandlerId ~= nil and p5.currentHandlerId ~= p4.id)) and (not var5 and p4.props.isFocused)
		local isFocused_1 = not p5.isFocused and p4.props.isFocused
		local var10 = if p5.isFocused then not p4.props.isFocused else var5 and not var6
		local var11 = p5.currentHandlerId == p4.id and p4.props.currentHandlerId ~= p4.id
		
		if isFocused_1 or isFocused then
			p4.props.requestFocusForHandlerId(p4.id)
		elseif var7 and p4.props.didFocus then
			p4.props.didFocus(id)
		end
		if var10 and p4.props.currentHandlerId == p4.id then
			p4.props.blurCurrentFocusHandler(p4.id, p4.props.shouldForgetPreviousSelection)
		end
		if var11 and p4.props.didBlur then
			p4.props.didBlur()
		end
	end
else
	function focusHandler.didUpdate(p6, p7) --[[ line: 135 ]]
		if p6.props.isFocused and not p7.isFocused and p6.props.didFocus then
			p6.props.didFocus()
			
			return
		elseif not p6.props.isFocused and p7.isFocused and p6.props.didBlur then
			p6.props.didBlur()
		end
	end
end
if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.willUnmount(p8) --[[ line: 145 ]]
		if p8.props.isFocused then
			p8.props.blurCurrentFocusHandler(p8.id, true)
			
			if p8.props.didBlur then
				p8.props.didBlur()
				
				return
			end
		else
			p8.props.forgetLastSelectionForHandlerId(p8.id)
		end
	end
else
	function focusHandler.willUnmount(p9) --[[ line: 156 ]]
		if p9.props.isFocused and p9.props.didBlur then
			p9.props.didBlur()
		end
	end
end
return if getFFlagIGMGamepadSelectionHistoryModule() then function(p10) --[[ line: 164 | named "FocusHandlerWithContext" ]]
	-- upvalues: roact (ref), focusHandlerContextModule (ref), focusHandler (ref), cryo (ref)
	return roact.createElement(focusHandlerContextModule.Consumer, {
		render = function(p11) --[[ line: 166 ]]
			-- upvalues: roact (copy), focusHandler (copy), cryo (copy), p10 (ref)
			return roact.createElement(focusHandler, cryo.Dictionary.join(p10, {
				currentHandlerId = p11.currentHandlerId,
				previousSelections = p11.previousSelections,
				requestFocusForHandlerId = p11.requestFocusForHandlerId,
				forgetLastSelectionForHandlerId = p11.forgetLastSelectionForHandlerId,
				blurCurrentFocusHandler = p11.blurCurrentFocusHandler,
				candidateHandlerId = p11.candidateHandlerId
			}))
		end
	})
end else focusHandler