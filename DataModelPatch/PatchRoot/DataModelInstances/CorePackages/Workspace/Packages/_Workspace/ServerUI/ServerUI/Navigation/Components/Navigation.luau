local ServerUI = script:FindFirstAncestor("ServerUI")
local Parent = ServerUI.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local NavigationContextModule = require(ServerUI.Navigation.NavigationContext)

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), NavigationContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult and UseStateResult[#UseStateResult] or nil
	end)
	
	return ReactModule.createElement(NavigationContextModule.Provider, {
		value = {
			stack = UseStateResult,
			setStack = UseStateResult2,
			currentRoute = UseMemoResult,
			reset = function(ComponentRefs, Params, TemplateName)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2({
					{
						componentRefs = ComponentRefs,
						params = Params,
						templateName = TemplateName
					}
				})
			end,
			push = function(ComponentRefs, Params, p2)
				-- upvalues: UseMemoResult (copy), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy)
				if p2 or UseMemoResult and UseMemoResult.templateName then
					UseStateResult2(CryoModule.List.join(UseStateResult, {
						{
							componentRefs = ComponentRefs,
							params = Params,
							templateName = p2 or UseMemoResult.templateName
						}
					}))
				end
			end,
			pushParams = function(Params)
				-- upvalues: UseMemoResult (copy), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy)
				if UseMemoResult then
					UseStateResult2(CryoModule.List.join(UseStateResult, {
						{
							componentRefs = UseMemoResult.componentRefs,
							params = Params,
							templateName = UseMemoResult.templateName
						}
					}))
				end
			end
		}
	}, p1.children)
end