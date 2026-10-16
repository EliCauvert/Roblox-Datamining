local ReactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local ResponsiveModule = require(script.Parent.Parent.Responsive)
local ContainerRefModule = require(script.Parent.Parent.Context.ContainerRef)
local LuaAppResponsiveFixHookDeps = game:DefineFastFlag("LuaAppResponsiveFixHookDeps", false)

function id(p1) --[[ Line: 9 ]]
	return p1
end

function useResponsiveImpl(List, p1, p2) --[[ Line: 17 ]]
	-- upvalues: ReactModule (copy), ContainerRefModule (copy), ResponsiveModule (copy), LuaAppResponsiveFixHookDeps (copy)
	local List1 = if typeof(List) == "function" then List else id
	local UseContextResult = ReactModule.useContext(ContainerRefModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(List1(ResponsiveModule.DefaultKey))
	local UseRefResult = ReactModule.useRef("")
	local UseRefResult1 = ReactModule.useRef({ Key = ResponsiveModule.DefaultKey })
	local v1 = nil
	
	if typeof(List) == "table" then
		v1 = {}
		
		for _, value in List do
			v1[value] = true
		end
	end
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseContextResult (copy), ResponsiveModule (upval), p1 (copy), p2 (copy), v1 (ref), UseRefResult (copy), UseRefResult1 (copy), UseStateResult2 (copy), List1 (copy)
		if UseContextResult and UseContextResult.current then
			local BindContainerResult = ResponsiveModule.bindContainer(UseContextResult.current, p1)
			local Connection = BindContainerResult:connect(function() --[[ Line: 37 ]]
				-- upvalues: BindContainerResult (copy), p2 (upval), v1 (upval), UseRefResult (upval), UseRefResult1 (upval), UseStateResult2 (upval), List1 (upval)
				local CurrentKeyResult = BindContainerResult:currentKey(p2)
				
				if v1 then
					if v1[CurrentKeyResult] or UseRefResult.current and v1[UseRefResult.current] then
						UseRefResult1.current = BindContainerResult:currentRule(p2)
						UseStateResult2(CurrentKeyResult)
					end
				else
					UseRefResult1.current = BindContainerResult:currentRule(p2)
					UseStateResult2(List1(CurrentKeyResult))
				end
				UseRefResult.current = CurrentKeyResult
			end)
			UseRefResult1.current = BindContainerResult:currentRule(p2)
			local CurrentKeyResult = BindContainerResult:currentKey(p2)
			UseStateResult2(List1(CurrentKeyResult))
			UseRefResult.current = CurrentKeyResult
			
			return function() --[[ Line: 56 ]]
				-- upvalues: Connection (copy), BindContainerResult (copy)
				Connection:disconnect()
				BindContainerResult:destroy()
			end
		else
			return function() --[[ Line: 61 ]] end
		end
	end, {
		UseContextResult,
		UseContextResult and UseContextResult.current or false,
		if LuaAppResponsiveFixHookDeps then p1 else nil,
		if LuaAppResponsiveFixHookDeps then p2 else nil
	})
	
	return UseStateResult, UseRefResult1.current
end

return useResponsiveImpl