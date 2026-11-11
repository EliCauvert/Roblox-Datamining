local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LocalizationService = game:GetService("LocalizationService")
local CorePackages = game:GetService("CorePackages")
local ImmutableModule = require(Modules.Common.Immutable)
local RoactModule = require(Modules.Common.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local TutilsModule = require(CorePackages.Packages.tutils)
local RoactServicesContext = require(CorePackages.Workspace.Packages.RoactServices).RoactServicesContext
local FFlagMigrateRoactUtilsToReactUtils = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils()
local Service = require(CorePackages.Workspace.Packages.RoactServices).RoactServices.createService(script.Name)

function Service.connect(List)
	-- upvalues: RoactModule (copy), Service (copy), LocalizationService (copy), ImmutableModule (copy), FFlagMigrateRoactUtilsToReactUtils (copy), ExternalEventConnectionModule (copy), TutilsModule (copy), RoactServicesContext (copy), CryoModule (copy)
	local t = {}
	
	for _, value in ipairs(List) do
		t[value] = true
	end
	return function(p1)
		-- upvalues: RoactModule (upval), Service (upval), LocalizationService (upval), t (copy), ImmutableModule (upval), FFlagMigrateRoactUtilsToReactUtils (upval), ExternalEventConnectionModule (upval), TutilsModule (upval), RoactServicesContext (upval), CryoModule (upval)
		assert(p1 ~= nil, "Expected component to be passed to connection, got nil.")
		local ExtendResult = RoactModule.Component:extend((("Localize(%s)"):format((tostring(p1)))))
		
		function ExtendResult.init(p2)
			-- upvalues: Service (upval), p1 (copy), LocalizationService (upval)
			local GetResult = Service.get(p2.props.services)
			assert(GetResult ~= nil, table.concat({
				"Cannot initialize RoactLocalization component without being a descendent of ServiceProvider!",
				("Tried to wrap component %q"):format((tostring(p1))),
				"Make sure there is a ServiceProvider above this component in the tree."
			}, "\n"))
			p2.state = { locale = LocalizationService.RobloxLocaleId }
			p2.localization = GetResult
			
			function p2.updateLocalization(Locale)
				-- upvalues: p2 (copy)
				p2:setState({ locale = Locale })
			end
		end
		
		function ExtendResult.render(p2)
			-- upvalues: Service (upval), t (upval), ImmutableModule (upval), p1 (copy), FFlagMigrateRoactUtilsToReactUtils (upval), RoactModule (upval), ExternalEventConnectionModule (upval), LocalizationService (upval)
			local GetResult = Service.get(p2.props.services)
			local FormatResults = {}
			
			for i in pairs(t) do
				local InnerProp = p2.props.innerProps[i]
				assert(InnerProp ~= nil, ("No localization string or table found for \"%s\""):format(i))
				assert(type(InnerProp) == "table" or type(InnerProp) == "string", ("Localized field \"%s\" is not a string or table."):format(i))
				
				if type(InnerProp) == "table" then
					assert(type(InnerProp[1]) == "string", ("Localization table \"%s\" requires a key of type string, got %s"):format(i, (type(InnerProp[1]))))
					FormatResults[i] = GetResult:Format(InnerProp[1], InnerProp)
				else
					FormatResults[i] = GetResult:Format(InnerProp)
				end
			end
			local JoinDictionariesResult = ImmutableModule.JoinDictionaries(p2.props.innerProps, FormatResults)
			
			if type(p1) == "string" then
				JoinDictionariesResult.locale = nil
			end
			return if FFlagMigrateRoactUtilsToReactUtils then RoactModule.createFragment({
				RobloxLocaleIdChangedConnection = RoactModule.createElement(ExternalEventConnectionModule, {
					event = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"),
					callback = p2.updateLocalization
				}),
				Component = RoactModule.createElement(p1, JoinDictionariesResult)
			}) else RoactModule.createElement(ExternalEventConnectionModule, {
				event = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"),
				callback = p2.updateLocalization
			}, {
				Component = RoactModule.createElement(p1, JoinDictionariesResult)
			})
		end
		
		function ExtendResult.shouldUpdate(p3, p4, State): boolean
			-- upvalues: t (upval), TutilsModule (upval)
			if State ~= p3.state then
				return true
			end
			for i in pairs(t) do
				local InnerProp = p4.innerProps[i]
				local InnerProp1 = p3.props.innerProps[i]
				
				if InnerProp == nil or InnerProp1 == nil then
					if InnerProp ~= nil or InnerProp1 ~= nil then
						return true
					end
				elseif type(InnerProp) == "table" and type(InnerProp1) == "table" then
					if not TutilsModule.shallowEqual(InnerProp, InnerProp1) then
						return true
					end
				elseif InnerProp ~= InnerProp1 then
					return true
				end
			end
			return not TutilsModule.shallowEqual(p4, p3.props.innerProps, t)
		end
		
		local ConnectionWrapper = RoactModule.PureComponent:extend("ConnectionWrapper")
		
		function ConnectionWrapper.render(p5)
			-- upvalues: RoactModule (upval), RoactServicesContext (upval), CryoModule (upval), ExtendResult (copy)
			return RoactModule.createElement(RoactServicesContext.Consumer, {
				render = function(Services)
					-- upvalues: CryoModule (upval), p5 (copy), RoactModule (upval), ExtendResult (upval)
					return RoactModule.createElement(ExtendResult, {
						services = Services,
						innerProps = CryoModule.Dictionary.join(p5.props, {
							forwardRef = CryoModule.None,
							[RoactModule.Ref] = p5.props.forwardRef
						})
					})
				end
			})
		end
		
		return RoactModule.forwardRef(function(p5, ForwardRef)
			-- upvalues: RoactModule (upval), ConnectionWrapper (copy), CryoModule (upval)
			return RoactModule.createElement(ConnectionWrapper, CryoModule.Dictionary.join(p5, { forwardRef = ForwardRef }))
		end)
	end
end

return Service