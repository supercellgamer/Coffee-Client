local cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local function runcode(func)
	func()
end
local vec3 = Vector3.new
local cfnew = CFrame.new
runcode(function()
	local CustomAnimations = {["Enabled"] = false}
    local CustomAnimationsMode = {["Value"] = "Test"}
    local CustomXPos = {["Value"] = 0}
    local CustomYPos = {["Value"] = 0}
    local CustomZPos = {["Value"] = 0}
    local CustomXAngle = {["Value"] = 0}
    local CustomYAngle = {["Value"] = 0}
    local CustomZAngle = {["Value"] = 0}
    local CustomTime = {["Value"] = 0.15}
    local customAnims = {}
    local customAnimX = {}
    local customAnimY = {}
    local customAnimZ = {}
    local customAngleAnimX = {}
    local customAngleAnimY = {}
    local customAngleAnimZ = {}
    local customAnimTime = {}
    local origC0 = nil
	local animationcurrentanim
    local animationdelay = tick()
    local animationplaying = false
    local customAnimList = {
        Test = {
            {CFrame = cfnew(customAnimX[CustomAnimationsMode["Value"]] or 0, customAnimY[CustomAnimationsMode["Value"]] or 0, customAnimZ[CustomAnimationsMode["Value"]] or 0) * CFrame.Angles(math.rad(customAngleAnimX[CustomAnimationsMode["Value"]] or 0), math.rad(customAngleAnimY[CustomAnimationsMode["Value"]] or 0), math.rad(customAngleAnimZ[CustomAnimationsMode["Value"]] or 0)), Time = customAnimTime[CustomAnimationsMode["Value"]] or 0.15}
        }
    }
	CustomAnimations = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Animations",
		["Function"] = function(callback) 
			if callback then 
                task.spawn(function()
                    repeat
                        task.wait()
                        if CustomAnimations["Enabled"] then
                                pcall(function()
                                    if origC0 == nil then
                                        origC0 = cam.Viewmodel.RightHand.RightWrist.C0
                                    end
                                    if animationplaying == false then
                                        animationplaying = true
                                        for i,v in pairs(customAnimList[CustomAnimationsMode["Value"]]) do 
                                            if (not CustomAnimations["Enabled"]) then break end
                                            animationcurrentanim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                            animationcurrentanim:Play()
                                            task.wait(v.Time - 0.01)
                                        end
                                        animationplaying = false
                                    end
                                end)	
                        end
                    until CustomAnimations["Enabled"] == false
                end)
			end
		end
	})
    CustomXPos = CustomAnimations.CreateSlider({
		["Name"] = "X Position",
		["Min"] = -3,
		["Max"] = 3,
		["Function"] = function(val) 
            customAnimX[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomYPos = CustomAnimations.CreateSlider({
		["Name"] = "Y Position",
		["Min"] = -3,
		["Max"] = 3,
		["Function"] = function(val)
            customAnimY[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomZPos = CustomAnimations.CreateSlider({
		["Name"] = "Z Position",
		["Min"] = -3,
		["Max"] = 3,
		["Function"] = function(val)
            customAnimZ[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomXAngle = CustomAnimations.CreateSlider({
		["Name"] = "X Angle",
		["Min"] = -360,
		["Max"] = 360,
		["Function"] = function(val)
            customAngleAnimX[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomYAngle = CustomAnimations.CreateSlider({
		["Name"] = "Y Angle",
		["Min"] = -360,
		["Max"] = 360,
		["Function"] = function(val)
            customAngleAnimY[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomZAngle = CustomAnimations.CreateSlider({
		["Name"] = "Z Angle",
		["Min"] = -360,
		["Max"] = 360,
		["Function"] = function(val)
            customAngleAnimZ[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomTime = CustomAnimations.CreateSlider({
		["Name"] = "Time",
		["Min"] = 0.01,
		["Max"] = 0.5,
		["Function"] = function(val)
            customAnimTime[CustomAnimationsMode["Value"]] = val
        end,
		["Default"] = 0
	})
    CustomAnimationsMode = CustomAnimations.CreateDropdown({
		["Name"] = "Mode",
		["List"] = {"Slow Tap", "Fast Tap", "Flat", "Jello", "Bounce"},
		["Function"] = function()
        end
	})
end)

