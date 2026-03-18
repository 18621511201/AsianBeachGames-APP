exports.handler = async (event) => {
  if (event.httpMethod !== 'GET') return { statusCode: 405, body: 'Method Not Allowed' };
  try {
    const SB_URL = 'https://mdgfcgxtlxgzkvoiqonp.supabase.co';
    const SB_SVC = process.env.SB_SVC;
    if (!SB_SVC) return { statusCode: 500, body: 'SB_SVC not configured' };
    const limit = event.queryStringParameters?.limit || 50;
    const resp = await fetch(`${SB_URL}/rest/v1/audit_logs?order=created_at.desc&limit=${limit}`, {
      headers: {
        'apikey': SB_SVC,
        'Authorization': 'Bearer ' + SB_SVC
      }
    });
    const body = await resp.text();
    return { statusCode: resp.ok ? 200 : resp.status, body, headers: { 'Content-Type': 'application/json' } };
  } catch (e) {
    return { statusCode: 500, body: e.message };
  }
};
