local LocalizationService = game:GetService("LocalizationService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Localization = require(Parent1.RobloxAppLocales).Localization
local LocaleProviderModule = require(Parent.Locale.LocaleProvider)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local RoactModule = require(Parent1.Roact)
local OtterModule = require(Parent1.Otter)
local ExtendResult = RoactModule.Component:extend(script.Name)
local config = { dampingRatio = 1, frequency = 1.6 }

function ExtendResult.init(p1) --[[ Line: 35 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy)
	p1.state = { shouldRenderChildren = p1.props.shouldShow }
	local Binding, Binding2 = RoactModule.createBinding(1)
	p1.motor = OtterModule.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(Binding2)
	p1.animationProgress = Binding
	p1.motor:onComplete(function() --[[ Line: 48 ]]
		-- upvalues: p1 (copy)
		local Props = p1.props
		
		if not Props.shouldShow then
			p1:setState({ shouldRenderChildren = false })
			
			if Props.onHidden ~= nil then
				Props.onHidden()
			end
		elseif Props.onShown ~= nil then
			Props.onShown()
			
			return
		end
	end)
	local v1: number = if p1.props.shouldShow then 0 else 1
	
	if p1.props.skipAnimation then
		p1.motor:setGoal(OtterModule.instant(v1))
		
		return
	else
		p1.motor:setGoal(OtterModule.spring(v1, config))
	end
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 72 ]]
	-- upvalues: OtterModule (copy), config (copy)
	local Props = p1.props
	
	if p2.shouldShow ~= Props.shouldShow then
		if Props.shouldShow then
			p1:setState({ shouldRenderChildren = Props.shouldShow })
		end
		local v1: number = if p1.props.shouldShow then 0 else 1
		
		if p1.props.skipAnimation then
			p1.motor:setGoal(OtterModule.instant(v1))
			
			return
		end
		p1.motor:setGoal(OtterModule.spring(v1, config))
	end
end

function ExtendResult.willUnmount(p1) --[[ Line: 90 ]]
	p1.motor:destroy()
end

function ExtendResult.renderWithoutLocale(p1) --[[ Line: 94 ]]
	-- upvalues: RoactModule (copy)
	local Props = p1.props
	
	return if Props.shouldAnimate then RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p1.animationProgress:map(function(p2: number): UDim2 --[[ Line: 102 ]]
			-- upvalues: Props (copy)
			return if Props.animateDown then UDim2.new(0, 0, -1 * p2, 0) else UDim2.new(0, 0, 1 * p2, 0)
		end),
		ZIndex = Props.ZIndex
	}, p1.state.shouldRenderChildren and Props.renderChildren() or nil) elseif Props.shouldShow then Props.renderChildren() else nil
end

function ExtendResult.render(p1) --[[ Line: 120 ]]
	-- upvalues: RoactModule (copy), LocaleProviderModule (copy), LocalizationService (copy), LocalizationProvider (copy), Localization (copy)
	return RoactModule.createElement(LocaleProviderModule, {
		locale = LocalizationService and LocalizationService.RobloxLocaleId
	}, {
		RoactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, { p1:renderWithoutLocale() })
	})
end

return ExtendResult