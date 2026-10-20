local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local CrossDeviceLogin = require(Parent.AuthCommon).Thunks.CrossDeviceLogin
local LoginByCodeFunction = require(Parent.AuthCommon).Thunks.LoginByCode
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local Logger = require(Parent.Loggers).Logger
local PollMagicLoginStatusType = require(LoginV2.Enums).PollMagicLoginStatusType

local function pollLoginStatus(p1)
	-- upvalues: CrossDeviceLogin (copy), PollMagicLoginStatusType (copy), LoginByCodeFunction (copy), CloseCentralOverlayFunction (copy), Logger (copy), pollLoginStatus (copy)
	local Networking = p1.networking
	local DeviceCode = p1.deviceCode
	local PrivateKey = p1.privateKey
	local IsMounted = p1.isMounted
	local LaunchAppFunction = p1.launchApp
	local OnErrorFunction = p1.onError
	local RetriesLeft = p1.retriesLeft
	local Store = p1.store
	
	return CrossDeviceLogin.GetLoginStatus(Networking, DeviceCode, PrivateKey)():andThen(function(Result)
		-- upvalues: IsMounted (copy), PollMagicLoginStatusType (upval), LoginByCodeFunction (upval), Networking (copy), DeviceCode (copy), PrivateKey (copy), Store (copy), CloseCentralOverlayFunction (upval), LaunchAppFunction (copy), Logger (upval), OnErrorFunction (copy), RetriesLeft (copy), pollLoginStatus (upval)
		if IsMounted.current then
			if Result.Status == PollMagicLoginStatusType.VALIDATED then
				return LoginByCodeFunction(Networking, DeviceCode, PrivateKey, nil, nil, nil, nil)():andThen(function(_)
					-- upvalues: IsMounted (upval), Store (upval), CloseCentralOverlayFunction (upval), LaunchAppFunction (upval)
					if IsMounted.current then
						Store:dispatch(CloseCentralOverlayFunction())
						
						if LaunchAppFunction then
							LaunchAppFunction()
						end
					end
				end, function(Text)
					-- upvalues: IsMounted (upval), Logger (upval), OnErrorFunction (upval)
					if IsMounted.current then
						Logger:warning("Login failed:" .. Text)
						OnErrorFunction()
					end
				end)
			elseif Result.Status ~= PollMagicLoginStatusType.EXPIRED and Result.Status ~= PollMagicLoginStatusType.CANCELLED then
				spawn(function()
					-- upvalues: IsMounted (upval), RetriesLeft (upval), Networking (upval), DeviceCode (upval), PrivateKey (upval), LaunchAppFunction (upval), OnErrorFunction (upval), Store (upval), pollLoginStatus (upval)
					wait(2)
					
					if IsMounted.current and RetriesLeft > 0 then
						pollLoginStatus({
							networking = Networking,
							deviceCode = DeviceCode,
							privateKey = PrivateKey,
							isMounted = IsMounted,
							launchApp = LaunchAppFunction,
							onError = OnErrorFunction,
							retriesLeft = RetriesLeft - 1,
							store = Store
						})
						
						return
					end
					if IsMounted.current then
						OnErrorFunction()
					end
				end)
			elseif IsMounted.current then
				OnErrorFunction()
				
				return
			end
		end
	end, function(p2)
		-- upvalues: IsMounted (copy), PollMagicLoginStatusType (upval), OnErrorFunction (copy), RetriesLeft (copy), Networking (copy), DeviceCode (copy), PrivateKey (copy), LaunchAppFunction (copy), Store (copy), pollLoginStatus (upval)
		if IsMounted.current then
			if p2.Body == PollMagicLoginStatusType.CODE_INVALID then
				OnErrorFunction()
				
				return
			end
			spawn(function()
				-- upvalues: IsMounted (upval), RetriesLeft (upval), Networking (upval), DeviceCode (upval), PrivateKey (upval), LaunchAppFunction (upval), OnErrorFunction (upval), Store (upval), pollLoginStatus (upval)
				wait(2)
				
				if IsMounted.current and RetriesLeft > 0 then
					pollLoginStatus({
						networking = Networking,
						deviceCode = DeviceCode,
						privateKey = PrivateKey,
						isMounted = IsMounted,
						launchApp = LaunchAppFunction,
						onError = OnErrorFunction,
						retriesLeft = RetriesLeft - 1,
						store = Store
					})
					
					return
				end
				if IsMounted.current then
					OnErrorFunction()
				end
			end)
		end
	end)
end

return function(Networking, DeviceCode, PrivateKey, IsMounted, LaunchApp, OnError)
	-- upvalues: pollLoginStatus (copy)
	return function(Store)
		-- upvalues: Networking (copy), DeviceCode (copy), PrivateKey (copy), IsMounted (copy), LaunchApp (copy), OnError (copy), pollLoginStatus (upval)
		return pollLoginStatus({
			retriesLeft = 50,
			networking = Networking,
			deviceCode = DeviceCode,
			privateKey = PrivateKey,
			isMounted = IsMounted,
			launchApp = LaunchApp,
			onError = OnError,
			store = Store
		})
	end
end