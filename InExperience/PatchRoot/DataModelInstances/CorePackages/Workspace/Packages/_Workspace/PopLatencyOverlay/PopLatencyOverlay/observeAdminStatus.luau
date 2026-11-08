return function(Object, Callback1, Callback: () -> ())
	local Count = 0
	local Connection = nil
	local LocalPlayer = nil
	local UserId = nil
	local v1 = nil
	local Count1 = nil
	
	local function _()
		-- upvalues: Connection (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	local function refresh()
		-- upvalues: Count (ref), Count1 (ref), LocalPlayer (ref), UserId (ref), v1 (ref), Connection (ref), Object (copy), refresh (copy), Callback (copy)
		Count += 1
		Count1 = nil
		LocalPlayer = nil
		UserId = nil
		v1 = nil
		
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		local LocalPlayer1 = Object.LocalPlayer
		
		if LocalPlayer1 then
			Connection = LocalPlayer1:GetPropertyChangedSignal("UserId"):Connect(refresh)
		end
		Callback()
	end
	
	local function authorize(): boolean
		-- upvalues: Object (copy), LocalPlayer (ref), UserId (ref), v1 (ref), Count1 (ref), Count (ref), Callback1 (copy)
		local LocalPlayer1 = Object.LocalPlayer
		
		if not LocalPlayer1 or LocalPlayer1.UserId <= 0 then
			return false
		end
		local UserId1 = LocalPlayer1.UserId
		
		if LocalPlayer == LocalPlayer1 and UserId == UserId1 and v1 ~= nil then
			return v1
		end
		if Count1 == Count then
			return false
		end
		local Count2 = Count
		Count1 = Count2
		local Success, Result = pcall(function()
			-- upvalues: Callback1 (upval), UserId1 (copy)
			return Callback1(UserId1)
		end)
		
		if Count1 == Count2 then
			Count1 = nil
		end
		if Count2 ~= Count or Object.LocalPlayer ~= LocalPlayer1 or LocalPlayer1.UserId ~= UserId1 then
			return false
		elseif Success then
			LocalPlayer = LocalPlayer1
			UserId = UserId1
			v1 = Result == true
			
			return v1
		else
			return false
		end
	end
	
	local Connection1 = Object:GetPropertyChangedSignal("LocalPlayer"):Connect(refresh)
	Count += 1
	Count1 = nil
	LocalPlayer = nil
	UserId = nil
	v1 = nil
	
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	local LocalPlayer1 = Object.LocalPlayer
	
	if LocalPlayer1 then
		Connection = LocalPlayer1:GetPropertyChangedSignal("UserId"):Connect(refresh)
	end
	Callback()
	
	return authorize, function()
		-- upvalues: Count (ref), Connection (ref), Connection1 (copy)
		Count += 1
		
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		Connection1:Disconnect()
	end
end