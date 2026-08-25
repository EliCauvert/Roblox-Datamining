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

function name.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), t (ref)
	p0.state = { shouldRenderChildren = p0.props.shouldShow }
	local var6, var7 = roactModule.createBinding(1)
	p0.motor = otterModule.createSingleMotor(1)
	p0.motor:start()
	p0.motor:onStep(var7)
	p0.animationProgress = var6
	p0.motor:onComplete(function()
		-- upvalues: p0 (ref)
		local props = p0.props
		
		if props.shouldShow then
			if props.onShown == nil then
				return
			else
				props.onShown()
				
				return
			end
		else
			p0:setState({ shouldRenderChildren = false })
			
			if props.onHidden ~= nil then
				props.onHidden()
			end
		end
	end)
	local var8 = if p0.props.shouldShow then 0 else 1
	
	if fFlagEnableUnifiedProductPurchaseFlow and p0.props.skipAnimation then
		p0.motor:setGoal(otterModule.instant(var8))
		
		return
	end
	p0.motor:setGoal(otterModule.spring(var8, t))
end

function name.didUpdate(p1, p2, _)
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), otterModule (ref), t (ref)
	local props = p1.props
	
	if p2.shouldShow ~= props.shouldShow then
		if props.shouldShow then
			p1:setState({ shouldRenderChildren = props.shouldShow })
		end
		local var9 = if p1.props.shouldShow then 0 else 1
		
		if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
			p1.motor:setGoal(otterModule.instant(var9))
			
			return
		end
		p1.motor:setGoal(otterModule.spring(var9, t))
	end
end

function name.willUnmount(p3)
	p3.motor:destroy()
end

function name.renderWithoutLocale(p4)
	-- upvalues: roactModule (ref)
	local props = p4.props
	
	return if props.shouldAnimate then roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p4.animationProgress:map(function(p5)
			-- upvalues: props (ref)
			return if props.animateDown then UDim2.new(0, 0, -1 * p5, 0) else UDim2.new(0, 0, 1 * p5, 0)
		end),
		ZIndex = props.ZIndex
	}, p4.state.shouldRenderChildren and props.renderChildren() or nil) elseif props.shouldShow then props.renderChildren() else nil
end

function name.render(p6)
	-- upvalues: roactModule (ref), localeProviderModule (ref), localizationService (ref), localizationProvider (ref), localization (ref)
	return roactModule.createElement(localeProviderModule, {
		locale = localizationService and localizationService.RobloxLocaleId
	}, {
		roactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { p6:renderWithoutLocale() })
	})
end

return name