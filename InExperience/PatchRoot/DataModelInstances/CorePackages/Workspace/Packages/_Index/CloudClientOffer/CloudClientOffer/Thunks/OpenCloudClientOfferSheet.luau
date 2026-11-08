local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local Parent = CloudClientOffer.Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local SignalsModule = require(Parent.Signals)
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local _ = require(CloudClientOffer.createCloudClientOffer)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay

return function(p1, p2)
	-- upvalues: CloseCentralOverlayFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), SignalsModule (copy)
	return function(p3)
		-- upvalues: CloseCentralOverlayFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p2 (copy), p1 (copy), SignalsModule (upval)
		local Flag = false
		
		local function _(Callback)
			-- upvalues: Flag (ref), p3 (copy), CloseCentralOverlayFunction (upval)
			return function()
				-- upvalues: Flag (upval), p3 (upval), CloseCentralOverlayFunction (upval), Callback (copy)
				if not Flag then
					Flag = true
					p3:dispatch(CloseCentralOverlayFunction())
					Callback()
					
					return
				end
			end
		end
		
		local Callback = nil
		local Accept = p1.accept
		
		local function OnAccept()
			-- upvalues: Flag (ref), p3 (copy), CloseCentralOverlayFunction (upval), Accept (copy)
			if not Flag then
				Flag = true
				p3:dispatch(CloseCentralOverlayFunction())
				Accept()
				
				return
			end
		end
		
		local Decline = p1.decline
		
		local function OnDecline()
			-- upvalues: Flag (ref), p3 (copy), CloseCentralOverlayFunction (upval), Decline (copy)
			if not Flag then
				Flag = true
				p3:dispatch(CloseCentralOverlayFunction())
				Decline()
				
				return
			end
		end
		
		local Dismiss = p1.dismiss
		p3:dispatch(SetCentralOverlayFunction(CentralOverlayType.CloudClientOfferSheet, {
			offerKind = p2.kind,
			onAccept = OnAccept,
			onDecline = OnDecline,
			onDismiss = function()
				-- upvalues: Flag (ref), p3 (copy), CloseCentralOverlayFunction (upval), Dismiss (copy)
				if not Flag then
					Flag = true
					p3:dispatch(CloseCentralOverlayFunction())
					Dismiss()
					
					return
				end
			end,
			onUnmount = function()
				-- upvalues: Callback (ref), Flag (ref), p1 (upval)
				if Callback ~= nil then
					Callback()
					Callback = nil
				end
				if not Flag then
					Flag = true
					p1.dismiss()
				end
			end
		}))
		Callback = SignalsModule.createEffect(function(p4)
			-- upvalues: p1 (upval), Flag (ref), p3 (copy), CloseCentralOverlayFunction (upval)
			if p1.getHeldOffer(p4) == nil and not Flag then
				Flag = true
				p3:dispatch(CloseCentralOverlayFunction())
			end
		end)
	end
end