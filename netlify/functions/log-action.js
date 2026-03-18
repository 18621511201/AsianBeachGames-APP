exports.handler = async (event) => {
  if (event.httpMethod !== 'POST') return { statusCode: 405, body: 'Method Not Allowed' };
  try {
    const body = JSON.parse(event.body);
    const SB_URL = 'https://mdgfcgxtlxgzkvoiqonp.supabase.co';
    const SB_SVC = process.env.SB_SVC;
    if (!SB_SVC) return { statusCode: 500, body: 'SB_SVC not configured' };
    const resp = await fetch(`${SB_URL}/rest/v1/audit_logs`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': SB_SVC,
        'Authorization': 'Bearer ' + SB_SVC,
        'Prefer': 'return=minimal'
      },
      body: JSON.stringify(body)
    });
    return { statusCode: resp.ok ? 200 : resp.status, body: resp.ok ? 'ok' : await resp.text() };
  } catch (e) {
    return { statusCode: 500, body: e.message };
  }
};
