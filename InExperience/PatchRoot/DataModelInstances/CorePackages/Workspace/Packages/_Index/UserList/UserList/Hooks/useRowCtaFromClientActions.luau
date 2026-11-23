local UserList = script:FindFirstAncestor("UserList")
local ReactModule = require(UserList.Parent.React)
local _ = require(UserList.Common.Types)
local ConstantsModule = require(UserList.Common.Constants)
local ClientCtaRegistryModule = require(UserList.Cta.ClientCtaRegistry)
local UseFriendingHandlersModule = require(UserList.Hooks.useFriendingHandlers)

local function v6() end

return function(p1)
	-- upvalues: UseFriendingHandlersModule (copy), ReactModule (copy), ClientCtaRegistryModule (copy), v6 (copy), ConstantsModule (copy)
	local UseFriendingHandlersModuleResult = UseFriendingHandlersModule({
		showToast = p1.showToast,
		friendshipOriginSourceType = p1.friendshipOriginSourceType
	})
	local UserId = p1.userId
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	local UseStateResultEntry = UseStateResult[UserId]
	local PrimaryClientAction = p1.primaryClientAction
	local SecondaryClientAction = p1.secondaryClientAction
	local OnClientActionSuccessFunction = p1.onClientActionSuccess
	
	return ReactModule.useMemo(function()
		-- upvalues: UseStateResult2 (copy), ClientCtaRegistryModule (upval), UseFriendingHandlersModuleResult (copy), UseRefResult (copy), UserId (copy), OnClientActionSuccessFunction (copy), UseRefResult1 (copy), UseStateResultEntry (copy), v6 (upval), ConstantsModule (upval), PrimaryClientAction (copy), SecondaryClientAction (copy)
		local function _(p2, p3)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(function(Tbl)
				-- upvalues: p2 (copy), p3 (copy)
				local Copy = table.clone(Tbl)
				Copy[p2] = p3
				
				return Copy
			end)
		end
		
		local function runAction(p2)
			-- upvalues: ClientCtaRegistryModule (upval), UseFriendingHandlersModuleResult (upval), UseRefResult (upval), UserId (upval), UseStateResult2 (upval), OnClientActionSuccessFunction (upval), UseRefResult1 (upval)
			local HandlerKey = ClientCtaRegistryModule[p2].handlerKey
			local UseFriendingHandlersModuleResultEntry = if HandlerKey then UseFriendingHandlersModuleResult[HandlerKey] else nil
			
			if not UseRefResult.current[UserId] and UseFriendingHandlersModuleResultEntry then
				UseRefResult.current[UserId] = true
				UseStateResult2(function(Tbl)
					-- upvalues: UserId (copy), p2 (copy)
					local Copy = table.clone(Tbl)
					Copy[UserId] = p2
					
					return Copy
				end)
				UseFriendingHandlersModuleResultEntry(UserId, function()
					-- upvalues: OnClientActionSuccessFunction (upval), p2 (copy)
					if OnClientActionSuccessFunction then
						OnClientActionSuccessFunction(p2)
					end
				end):finally(function()
					-- upvalues: UseRefResult (upval), UserId (copy), UseRefResult1 (upval), UseStateResult2 (upval)
					UseRefResult.current[UserId] = nil
					
					if UseRefResult1.current then
						local v1 = nil
						UseStateResult2(function(Tbl)
							-- upvalues: UserId (copy), v1 (copy)
							local Copy = table.clone(Tbl)
							Copy[UserId] = v1
							
							return Copy
						end)
					end
				end)
				
				return
			end
		end
		
		local function buildCta(PrimaryClientAction)
			-- upvalues: ClientCtaRegistryModule (upval), UseStateResultEntry (upval), v6 (upval), runAction (copy), ConstantsModule (upval)
			local ClientCtaRegistryModuleEntry = if PrimaryClientAction then ClientCtaRegistryModule[PrimaryClientAction] else nil
			
			if PrimaryClientAction == nil or ClientCtaRegistryModuleEntry == nil then
				return nil
			else
				local IsNotUseStateResultEntryMatch: boolean = UseStateResultEntry ~= nil and UseStateResultEntry ~= PrimaryClientAction
				
				return {
					type = ClientCtaRegistryModuleEntry.buttonType,
					icon = ClientCtaRegistryModuleEntry.icon,
					onActivated = if ClientCtaRegistryModuleEntry.isDisabled then v6 else function()
						-- upvalues: runAction (upval), PrimaryClientAction (copy)
						runAction(PrimaryClientAction)
					end,
					isDisabled = if ClientCtaRegistryModuleEntry.isDisabled or IsNotUseStateResultEntryMatch then true else nil,
					isLoading = UseStateResultEntry == PrimaryClientAction or nil,
					minWidth = ConstantsModule.DEFAULT_PRIMARY_CTA_MIN_WIDTH,
					maxWidth = ConstantsModule.DEFAULT_PRIMARY_CTA_MAX_WIDTH
				}
			end
		end
		
		return {
			primaryCta = buildCta(PrimaryClientAction),
			secondaryCta = buildCta(SecondaryClientAction)
		}
	end, {
		UserId, UseStateResultEntry, PrimaryClientAction, SecondaryClientAction,
		OnClientActionSuccessFunction, UseFriendingHandlersModuleResult
	})
end