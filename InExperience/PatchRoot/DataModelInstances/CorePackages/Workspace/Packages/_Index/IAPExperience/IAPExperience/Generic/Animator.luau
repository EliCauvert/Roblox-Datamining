local localizationService = game:GetService("LocalizationService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local localization = require(parent_1.RobloxAppLocales).Localization
local localeProviderModule = require(parent.Locale.LocaleProvider)
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local fFlagEnableUnifiedProductPurchaseFlow = require(parent_1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local roactModule = require(parent_1.Roact)
local otterModule = require(parent_1.Otter)
local name = roactModule.Component:extend(script.Name)
local t = { dampingRatio = 1, frequency = 1.6 }

function name.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), t (ref)
	p1.state = { shouldRenderChildren = p1.props.shouldShow }
	local var1, var2 = roactModule.createBinding(1)
	p1.motor = otterModule.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(var2)
	p1.animationProgress = var1
	p1.motor:onComplete(function()
		-- upvalues: p1 (ref)
		local props = p1.props
		
		if props.shouldShow then
			if props.onShown == nil then
				return
			else
				props.onShown()
				
				return
			end
		else
			p1:setState({ shouldRenderChildren = false })
			
			if props.onHidden ~= nil then
				props.onHidden()
			end
		end
	end)
	local var3 = if p1.props.shouldShow then 0 else 1
	
	if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
		p1.motor:setGoal(otterModule.instant(var3))
		
		return
	end
	p1.motor:setGoal(otterModule.spring(var3, t))
end

function name.didUpdate(p1, p2, _)
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), otterModule (ref), t (ref)
	local props = p1.props
	
	if p2.shouldShow ~= props.shouldShow then
		if props.shouldShow then
			p1:setState({ shouldRenderChildren = props.shouldShow })
		end
		local var1 = if p1.props.shouldShow then 0 else 1
		
		if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
			p1.motor:setGoal(otterModule.instant(var1))
			
			return
		end
		p1.motor:setGoal(otterModule.spring(var1, t))
	end
end

function name.willUnmount(p1)
	p1.motor:destroy()
end

function name.renderWithoutLocale(p1)
	-- upvalues: roactModule (ref)
	local props = p1.props
	
	return if props.shouldAnimate then roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p1.animationProgress:map(function(p2)
			-- upvalues: props (ref)
			return if props.animateDown then UDim2.new(0, 0, -1 * p2, 0) else UDim2.new(0, 0, 1 * p2, 0)
		end),
		ZIndex = props.ZIndex
	}, p1.state.shouldRenderChildren and props.renderChildren() or nil) elseif props.shouldShow then props.renderChildren() else nil
end

function name.render(p1)
	-- upvalues: roactModule (ref), localeProviderModule (ref), localizationService (ref), localizationProvider (ref), localization (ref)
	return roactModule.createElement(localeProviderModule, {
		locale = localizationService and localizationService.RobloxLocaleId
	}, {
		roactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { p1:renderWithoutLocale() })
	})
end

return name