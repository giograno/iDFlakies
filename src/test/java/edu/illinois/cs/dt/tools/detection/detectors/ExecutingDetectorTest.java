package edu.illinois.cs.dt.tools.detection.detectors;

import org.junit.Test;

import java.util.prefs.Preferences;

import static org.junit.Assert.assertTrue;

/** Checks whether we can properly save and retrieve the rounds as a user preference */
public class ExecutingDetectorTest {
    private final String CURRENT_ROUND = "iDFlakies-round";

    @Test
    public void testPropertyWriting() {
        Preferences prefs = Preferences.userRoot();
        prefs.put(CURRENT_ROUND, "1");
        assertTrue("Setting rounds does not work", prefs.getInt(CURRENT_ROUND, 0) == 1);
        prefs.remove(CURRENT_ROUND);
    }

    @Test
    public void testEmptyProperty() {
        Preferences prefs = Preferences.userRoot();
        assertTrue("Retrieving the default key not working", prefs.getInt(CURRENT_ROUND, 0) == 0);
    }

    @Test
    public void testInvalidKey() {
        Preferences prefs = Preferences.userRoot();
        prefs.put(CURRENT_ROUND, "-1");
        assertTrue("Setting of the invalid key not working",prefs.getInt(CURRENT_ROUND, 0) == -1);
        prefs.remove(CURRENT_ROUND);
    }
}