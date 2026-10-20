local ServerUI = script:FindFirstAncestor("ServerUI")
local Parent = ServerUI.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIConfigurationModule = require(ServerUI.Components.UIConfiguration)
local _ = require(ServerUI.Types)
local UseStateFunction = ReactModule.useState
local ConstantsModule = require(ServerUI.Constants)
local UseNavigatorModule = require(ServerUI.Navigation.Hooks.useNavigator)
local config = {
	enableLogging = false,
	maxRetryCount = game:DefineFastInt("ReactServerUIViewHttpRetryCount", 1)
}
local ForwardRefResult = ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ConstantsModule (copy), UseNavigatorModule (copy), ReactModule (copy), CryoModule (copy)
	local DefaultTemplateName = p1.defaultTemplateName or ConstantsModule.DEFAULT_TEMPLATE_NAME
	local UiDefinition = p1.uiDefinition
	local UseNavigatorModuleResult = UseNavigatorModule()
	local TemplateName = UseNavigatorModuleResult.currentRoute and UseNavigatorModuleResult.currentRoute.templateName or DefaultTemplateName
	ReactModule.useEffect(function()
		-- upvalues: UiDefinition (copy), TemplateName (copy), UseNavigatorModuleResult (copy)
		if UiDefinition then
			local Template = UiDefinition.templates[TemplateName]
			UseNavigatorModuleResult.reset(Template.children, {}, Template.name)
		end
	end, { UiDefinition })
	
	local function v14(Component)
		-- upvalues: p1 (copy), CryoModule (upval), UseNavigatorModuleResult (copy), ReactModule (upval)
		local Props = Component.props
		
		if p1.mapComponentPropsFromState then
			Props = CryoModule.Dictionary.join(Props, p1.mapComponentPropsFromState(Component))
		end
		if UseNavigatorModuleResult.currentRoute and UseNavigatorModuleResult.currentRoute.params and #CryoModule.Dictionary.keys(UseNavigatorModuleResult.currentRoute.params) > 0 then
			Props = CryoModule.Dictionary.join(Props, { params = UseNavigatorModuleResult.currentRoute.params })
		end
		return ReactModule.createElement(Component.component, Props, Component.children)
	end
	
	local function v15(Template, UiDefinition)
		-- upvalues: UseNavigatorModuleResult (copy), v14 (copy), CryoModule (upval), Ref (copy), ReactModule (upval)
		local t = {}
		
		if UseNavigatorModuleResult.currentRoute and UseNavigatorModuleResult.currentRoute.componentRefs then
			for _, componentRef in ipairs(UseNavigatorModuleResult.currentRoute.componentRefs) do
				local Component = UiDefinition.components[componentRef]
				
				if Component then
					local v1 = v14(Component)
					
					if v1 then
						t[Component.name] = v1
					end
				end
			end
		end
		Template.props = CryoModule.Dictionary.join({ ref = Ref }, Template.props or {})
		
		return ReactModule.createElement(Template.component, Template.props, t)
	end
	
	local TemplateName1 = UseNavigatorModuleResult.currentRoute and UseNavigatorModuleResult.currentRoute.templateName or DefaultTemplateName
	local Template = UiDefinition and UiDefinition.templates[TemplateName1]
	
	return Template and v15(Template, UiDefinition) or nil
end)

return (ReactModule.forwardRef(function(p2, Ref)
	-- upvalues: config (copy), UseDispatchFunction (copy), UseStateFunction (copy), ReactModule (copy), UIConfigurationModule (copy), ConstantsModule (copy), ForwardRefResult (copy)
	local UiConfigurationConfig = p2.uiConfigurationConfig or config
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	ReactModule.useEffect(function()
		-- upvalues: UIConfigurationModule (upval), UiConfigurationConfig (copy), UseDispatchResult (copy), p2 (copy), UseStateResult2 (copy), ConstantsModule (upval)
		UseDispatchResult(UIConfigurationModule.new(UiConfigurationConfig):fetch(p2.url, p2.queryArgs)):andThen(function(Result)
			-- upvalues: p2 (upval), UseStateResult2 (upval), ConstantsModule (upval)
			local ResponseBody = Result.responseBody
			local Success, Result1 = pcall(function()
				-- upvalues: p2 (upval), ResponseBody (copy)
				return p2.transform(ResponseBody)
			end)
			
			if Success and Result1 then
				UseStateResult2(Result1)
				
				return
			else
				p2.onError({
					type = ConstantsModule.CONFIGURATION_VIEW_ERROR.RENDER_TRANSFORM_ERROR
				})
			end
		end):catch(function()
			-- upvalues: p2 (upval), ConstantsModule (upval)
			p2.onError({
				type = ConstantsModule.CONFIGURATION_VIEW_ERROR.NETWORK_FETCH_ERROR
			})
		end)
	end, {})
	
	return ReactModule.createElement(ForwardRefResult, {
		uiDefinition = UseStateResult,
		defaultTemplateName = p2.defaultTemplateName,
		mapComponentPropsFromState = p2.mapComponentPropsFromState,
		ref = Ref
	})
end))