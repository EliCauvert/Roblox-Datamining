local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), CryoModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local t = {}
	local t1 = {}
	
	return {
		getUsersByUserId = Signal,
		getUserProfile = function(Key)
			-- upvalues: t (copy), CreateComputedFunction (upval), Signal (copy), t1 (copy)
			if t[Key] == nil then
				t[Key] = CreateComputedFunction(function(p1)
					-- upvalues: Signal (upval), Key (copy), t1 (upval)
					return Signal(p1)[Key] or t1
				end)
			end
			return t[Key]
		end,
		updateUsername = function(p1, Username)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local Text = tostring(p1)
			local SignalResult = Signal(false)
			Signal2((CryoModule.Dictionary.union(SignalResult, {
				[Text] = CryoModule.Dictionary.union(SignalResult[Text] or {}, { username = Username })
			})))
		end,
		updateAvatar = function(p1, AvatarThumbnailUri)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local Text = tostring(p1)
			local SignalResult = Signal(false)
			Signal2((CryoModule.Dictionary.union(SignalResult, {
				[Text] = CryoModule.Dictionary.union(SignalResult[Text] or {}, { avatarThumbnailUri = AvatarThumbnailUri })
			})))
		end,
		updateMomentsCount = function(p1, MomentsCount)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local Text = tostring(p1)
			local SignalResult = Signal(false)
			Signal2((CryoModule.Dictionary.union(SignalResult, {
				[Text] = CryoModule.Dictionary.union(SignalResult[Text] or {}, { momentsCount = MomentsCount })
			})))
		end,
		invalidateMomentsCount = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local Text = tostring(p1)
			local SignalResult = Signal(false)
			local SignalResultEntry = SignalResult[Text]
			
			if SignalResultEntry then
				Signal2((CryoModule.Dictionary.union(SignalResult, {
					[Text] = CryoModule.Dictionary.join(SignalResultEntry, { momentsCount = CryoModule.None })
				})))
				
				return
			end
		end,
		updateUserInfo = function(p1, DisplayName, HasVerifiedBadge)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local Text = tostring(p1)
			local SignalResult = Signal(false)
			Signal2((CryoModule.Dictionary.union(SignalResult, {
				[Text] = CryoModule.Dictionary.union(SignalResult[Text] or {}, {
					displayName = DisplayName,
					hasVerifiedBadge = HasVerifiedBadge
				})
			})))
		end
	}
end